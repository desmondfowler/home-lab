variable "proxmox_endpoint" {
    type = string
    description = "Proxmox API endpoint (e.g., https://your-proxmox-server:8006/)"

}

variable "proxmox_api_token" {
    type = string
    description = "Proxmox API token (format: terraform@pve!terraform-token=your-token-secret)"
    sensitive = true
}

variable "proxmox_node" {
    type = string
    description = "Proxmox node to create VMs on"

}

variable "template_vm_id" {
    type = number
    description = "ID of the template VM to clone from"
}

variable "vm_count" {
    type = number
    default = 3
    description = "Number of VMs to create (default 3 for purpose of Kubernetes cluster)"
}

variable "vm_name_prefix" {
    type = string
    default = "ubuntu-server"
    description = "Prefix for VM names"
}

variable "ssh_key" {
    type = string
    description = "SSH public key for VM access"
}

variable "vm_hostnames" {
    type = list(string)
    description = "List of hostnames for VMs"
    default = [ "ubuntu-server1", "ubuntu-server2", "ubuntu-server3" ]
}