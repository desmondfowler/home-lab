terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.72.0"
    }
  }
}

provider "proxmox" {
  endpoint  = var.proxmox_endpoint
  api_token = var.proxmox_api_token
  insecure  = true
}

resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  count     = var.vm_count
  name      = "${var.vm_name_prefix}-${count.index + 1}"
  node_name = var.proxmox_node

  clone {
    vm_id = var.template_vm_id
    full  = true
  }

  agent {
    enabled = true
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 2048
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"

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

output "vm_ip_addresses" {
  value = proxmox_virtual_environment_vm.ubuntu_vm[*].ipv4_addresses
}
