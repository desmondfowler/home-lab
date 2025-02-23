# Terraform

This project documents my journey using **Terraform** to provision 3 Ubuntu Server VMs on my Proxmox home lab, laying the groundwork for a virtualized Kubernetes cluster automated with Ansible. It showcases skills in **Infrastructure as Code (IaC)**, Proxmox virtualization, Cloud-Init, and DevOps workflows—key competencies for modern infrastructure management.

## Project Goals
- Master Terraform for IaC.
- Deploy 3 Ubuntu Server VMs on Proxmox.
- Build a foundation for a Kubernetes cluster.

## Installing Terraform
I installed Terraform on my Ubuntu-based WSL environment following the official docs:

```sh
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

## Configuring Proxmox Access

To enable Terraform to manage Proxmox, I created a user, role, and API token:

```sh
pveum role add TerraformProv -privs "Datastore.Allocate Datastore.AllocateSpace Datastore.AllocateTemplate Datastore.Audit Pool.Allocate Sys.Audit Sys.Console Sys.Modify SDN.Use VM.Allocate VM.Audit VM.Clone VM.Config.CDROM VM.Config.Cloudinit VM.Config.CPU VM.Config.Disk VM.Config.HWType VM.Config.Memory VM.Config.Network VM.Config.Options VM.Migrate VM.Monitor VM.PowerMgmt User.Modify"
pveum user add terraform@pve
pveum aclmod / -user terraform@pve -role TerraformProv
pveum user token add terraform@pve terraform-token --privsep=0
```

The API token is stored securely in terraform.tfvars (excluded via .gitignore).

## Proxmox Template Creation

Terraform clones VMs from templates, so I built one with Ubuntu Server 24.04:

### 1. VM Setup:
```sh
ls /var/lib/vz/template/iso/ # Make sure the .iso is there
qm create 9000 --name "ubuntu-server-template" --cores 2 --memory 2048 --net0 virtio,bridge=vmbr0 --ostype ls26
qm set 9000 --scsi0 local-lvm:50 # Create a 50Gb disk for VM storage
qm set 9000 --cdrom local:iso/ubuntu-24.04.1-live-server-amd64.iso # Attach the iso as cdrom
qm set 9000 --boot "order=scsi0;ide2" # Quotes needed because the shell interprets ; as a new command
qm set 9000 --scsihw virtio-scsi-pci
qm start 9000
```
### 2. Installation 

- Installed via Proxmox Web UI: minimal config, DHCP networking, SSH enabled, username "ubuntu".
- No LVM for simplicity; Proxmox handles snapshots.

### 3. Post-Install Setup:
- Installed required utilities, and made sure to configure the netplan.yaml file to ensure dhcp was active. 

```sh
sudo apt update && sudo apt upgrade -y
sudo apt install qemu-guest-agent cloud-init nano
sudo systemctl enable qemu-guest-agent
sudo apt autoremove && sudo apt clean
sudo rm -f /var/lib/apt/lists/*
history -c && > /root/.bash_history
sudo shutdown -h now
```

### 4. Convert to Template:

- Back in the Proxmox cli, we convert the VM to a template.

```sh
qm template 9000
```

Now we're ready to go.

## Terraform Configuration

### Files
Next, we create a few  configuration files for the terraform project: 

- [main.tf](./main.tf) Defines the Proxmox provider and VM resources.
- [variables.tf](./variables.tf) Reusable variables for flexibility.
- [terraform.tfvars.example](./terraform.tfvars.example) Example variable values.

Variables in variables.tf ensure flexibility (e.g., changing the Proxmox endpoint or node).

### Initial Setup

Running `terraform init` hit an error because I initially specified a non-existent HashiCorp provider. After fixing the source, it downloaded successfully, creating .terraform/ and .terraform.lock.hcl (committed to the repo). I used the bpg/proxmox community provider:

```hcl
terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.72.0"
    }
  }
}
```

Now, running `terraform init` downloaded the provider successfully into the `.terraform` folder, and created a .terraform.lock.hcl file, which it suggests to include in the version control repository (this Github repo). 

### VM Resource

The final main.tf provisions 3 VMs (see [main.tf](./main.tf) for full details):

```hcl
resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  count     = var.vm_count
  name      = "${var.vm_name_prefix}-${count.index + 1}"
  node_name = var.proxmox_node

  clone {
    vm_id = var.template_vm_id
    full  = true
  }
  initialization {
    ip_config {
      ipv4 {
        address = "dhcp"

      }
    }
    user_account {
      username = "ubuntu"
      keys     = [var.ssh_key]
    }
  }
}
```

### Execution

1. **Planning**
- `terraform plan` failed due to a missing `ipv4 {}` block in initialization. After fixing it, the plan was saved in [terraform-plan.md](./terraform-plan.md).

2. **Applying**
- After confirming that the plan looked good, we can run `terraform apply` which is the scary part. Running it, we receive TLS errors:

```sh
Error: ... tls: failed to verify certificate: x509: certificate signed by unknown authority
```
- Added `insecure = true` to the provider (non-prod workaround) and fixed permissions (--privsep=0 and role adjustments).
- More permissions errors, this time it was the Proxmox Role not having the correct permissions assigned at the time of creating the API key
- Modified Proxmox API key with `--privsep=0`
- Success:
```sh
proxmox_virtual_environment_vm.ubuntu_vm[0]: Creation complete after 1m42s [id=105]
proxmox_virtual_environment_vm.ubuntu_vm[1]: Creation complete after 1m49s [id=103]
proxmox_virtual_environment_vm.ubuntu_vm[2]: Creation complete after 1m50s [id=104]
Apply complete! Resources: 3 added, 0 changed, 0 destroyed.
```

- VMs were assigned DHCP IPs, accessible via SSH.

## Lessons Learned
- TLS Issues: Bypassed with `insecure = true` for now; a proper CA setup would be ideal for production.
- Permissions: Added --privsep=0 and broader privileges to fix token errors—more restrictive roles are ideal.
- Cloud-Init: Basic setup worked, but hostnames require dynamic Cloud-Init configs (next step).

## Next Steps
- Add variable-driven hostnames using Cloud-Init YAML files.
- Use Ansible to configure the VMs into a Kubernetes cluster (see [ansible.md](../ansible-kubernetes/ansible.md)).