# Terraform

I intend to learn how to use Terraform to improve my skills with IaC (infrastructure as code). 

## Installing Terraform

From their docs, installing on an ubuntu/Debian host (which WSL is), is easy:

```sh
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

## Using Terraform

First, we need to create a Proxmox user. In the webgui, we go to Datacenter > Permissions > Users, and click Add. I named mine `terraform-user` which is probably not the best practice, but we'll find out.

Next, we need to get an API key, which we can get from Permissions > API Tokens. I named by token ID `terraform-api-key`, and saved it, as well as the secret, in a `terraform.tfvars` file in the terraform folder of this repo (it is in the .gitignore). 

Next, we create a configuration file: [main.tf](./main.tf) which includes all the configuration info. The provider uses the Proxmox api, and the resource uses the `proxmox_vm_qemu` resource. The resource documentation is found [here](https://registry.terraform.io/providers/Telmate/proxmox/latest/docs/resources/vm_qemu). For this method, we're required to make an "ubuntu-server-clone" template to work off of. I create a simple Ubuntu Server 24.04 VM, with 2 cores, and 2048Mb of RAM (2Gb). 