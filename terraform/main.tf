provider "proxmox" {
  pm_api_url      = "https://192.168.0.123:8006/api2/json"
  pm_user         = var.pm_api_user
  pm_password     = var.pm_api_token_secret
  pm_tls_insecure = true
}

variable "vm_count" {
  default = 1
}

resource "proxmox_vm_qemu" "server" {
  count       = var.vm_count
  name        = "ubuntu-server-${format("%02d", count.index)}"
  target_node = "proxmox-server"
  clone       = "ubuntu-template"
  storage     = "local-lvm"
  cores       = 2
  memory      = 2048
}
