~/home-lab/terraform$ terraform plan

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # proxmox_virtual_environment_vm.ubuntu_vm[0] will be created
  + resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
      + acpi                    = true
      + bios                    = "seabios"
      + id                      = (known after apply)
      + ipv4_addresses          = (known after apply)
      + ipv6_addresses          = (known after apply)
      + keyboard_layout         = "en-us"
      + mac_addresses           = (known after apply)
      + migrate                 = false
      + name                    = "ubuntu-server-1"
      + network_interface_names = (known after apply)
      + node_name               = "proxmox-server"
      + on_boot                 = true
      + protection              = false
      + reboot                  = false
      + scsi_hardware           = "virtio-scsi-pci"
      + started                 = true
      + stop_on_destroy         = false
      + tablet_device           = true
      + template                = false
      + timeout_clone           = 1800
      + timeout_create          = 1800
      + timeout_migrate         = 1800
      + timeout_move_disk       = 1800
      + timeout_reboot          = 1800
      + timeout_shutdown_vm     = 1800
      + timeout_start_vm        = 1800
      + timeout_stop_vm         = 300
      + vm_id                   = (known after apply)

      + agent {
          + enabled = true
          + timeout = "15m"
          + trim    = false
          + type    = "virtio"
        }

      + clone {
          + full    = true
          + retries = 1
          + vm_id   = 9000
        }

      + cpu {
          + cores      = 2
          + hotplugged = 0
          + limit      = 0
          + numa       = false
          + sockets    = 1
          + type       = "qemu64"
          + units      = 1024
        }

      + initialization {
          + datastore_id = "local-lvm"
          + upgrade      = (known after apply)

          + ip_config {
              + ipv4 {
                  + address = "dhcp"
                }
            }

          + user_account {
              + keys     = [
                  + "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC4U9V00OImhe7yH78gqJRD47+DuzLuXcasHnlKtIKSwW28eoAhMXWRckMIxr20zMQ2Lx0TjdQnIXX1cQRRSk+/E6aaT5A5VWoPv3HWEZT7u7yFExyxSv2kP//PaX3HkMZLJ+UIry9fq3Fj3urzy3cK9wqpHwc+ZvOwsCcBtT24uEx+r7ZDPBh+39srqNBm0NcCh4owGkvWYq8NBX4fpWLWloRXzyYyQl2gy4JhwH1H4Ioi2sfUgZrRsWi2jLaURCwz+5oNTMFZDy3Xe1JXYdOdXkwrsDxhqANgO4P8bY9I/m5giHgyQ+CKaEtbvNmf10OIY1l8YYBLxBmwa7C/AvGJP98mIhkLvbsgt5TsoxlGd+nMe2j1GT2F7YKKXf0iqSxPYtAGhNUPbBUdJWbdbiUKKW4OpHv3m7Q8P8NzRYcoYAFzh0eXvFj4xXumwG25s3o4pBVDcgpY5BHcY8PLZiJbUK1tJgSEt2OreaANKTHj5oeHQJ1YD5q09p0iNX9qFNs= desmondfowler14@gmail.com",
                ]
              + username = "ubuntu"
            }
        }

      + memory {
          + dedicated      = 2048
          + floating       = 0
          + keep_hugepages = false
          + shared         = 0
        }

      + network_device {
          + bridge      = "vmbr0"
          + enabled     = true
          + firewall    = false
          + mac_address = (known after apply)
          + model       = "virtio"
          + mtu         = 0
          + queues      = 0
          + rate_limit  = 0
          + vlan_id     = 0
        }
    }

  # proxmox_virtual_environment_vm.ubuntu_vm[1] will be created
  + resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
      + acpi                    = true
      + bios                    = "seabios"
      + id                      = (known after apply)
      + ipv4_addresses          = (known after apply)
      + ipv6_addresses          = (known after apply)
      + keyboard_layout         = "en-us"
      + mac_addresses           = (known after apply)
      + migrate                 = false
      + name                    = "ubuntu-server-2"
      + network_interface_names = (known after apply)
      + node_name               = "proxmox-server"
      + on_boot                 = true
      + protection              = false
      + reboot                  = false
      + scsi_hardware           = "virtio-scsi-pci"
      + started                 = true
      + stop_on_destroy         = false
      + tablet_device           = true
      + template                = false
      + timeout_clone           = 1800
      + timeout_create          = 1800
      + timeout_migrate         = 1800
      + timeout_move_disk       = 1800
      + timeout_reboot          = 1800
      + timeout_shutdown_vm     = 1800
      + timeout_start_vm        = 1800
      + timeout_stop_vm         = 300
      + vm_id                   = (known after apply)

      + agent {
          + enabled = true
          + timeout = "15m"
          + trim    = false
          + type    = "virtio"
        }

      + clone {
          + full    = true
          + retries = 1
          + vm_id   = 9000
        }

      + cpu {
          + cores      = 2
          + hotplugged = 0
          + limit      = 0
          + numa       = false
          + sockets    = 1
          + type       = "qemu64"
          + units      = 1024
        }

      + initialization {
          + datastore_id = "local-lvm"
          + upgrade      = (known after apply)

          + ip_config {
              + ipv4 {
                  + address = "dhcp"
                }
            }

          + user_account {
              + keys     = [
                  + "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC4U9V00OImhe7yH78gqJRD47+DuzLuXcasHnlKtIKSwW28eoAhMXWRckMIxr20zMQ2Lx0TjdQnIXX1cQRRSk+/E6aaT5A5VWoPv3HWEZT7u7yFExyxSv2kP//PaX3HkMZLJ+UIry9fq3Fj3urzy3cK9wqpHwc+ZvOwsCcBtT24uEx+r7ZDPBh+39srqNBm0NcCh4owGkvWYq8NBX4fpWLWloRXzyYyQl2gy4JhwH1H4Ioi2sfUgZrRsWi2jLaURCwz+5oNTMFZDy3Xe1JXYdOdXkwrsDxhqANgO4P8bY9I/m5giHgyQ+CKaEtbvNmf10OIY1l8YYBLxBmwa7C/AvGJP98mIhkLvbsgt5TsoxlGd+nMe2j1GT2F7YKKXf0iqSxPYtAGhNUPbBUdJWbdbiUKKW4OpHv3m7Q8P8NzRYcoYAFzh0eXvFj4xXumwG25s3o4pBVDcgpY5BHcY8PLZiJbUK1tJgSEt2OreaANKTHj5oeHQJ1YD5q09p0iNX9qFNs= desmondfowler14@gmail.com",
                ]
              + username = "ubuntu"
            }
        }

      + memory {
          + dedicated      = 2048
          + floating       = 0
          + keep_hugepages = false
          + shared         = 0
        }

      + network_device {
          + bridge      = "vmbr0"
          + enabled     = true
          + firewall    = false
          + mac_address = (known after apply)
          + model       = "virtio"
          + mtu         = 0
          + queues      = 0
          + rate_limit  = 0
          + vlan_id     = 0
        }
    }

  # proxmox_virtual_environment_vm.ubuntu_vm[2] will be created
  + resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
      + acpi                    = true
      + bios                    = "seabios"
      + id                      = (known after apply)
      + ipv4_addresses          = (known after apply)
      + ipv6_addresses          = (known after apply)
      + keyboard_layout         = "en-us"
      + mac_addresses           = (known after apply)
      + migrate                 = false
      + name                    = "ubuntu-server-3"
      + network_interface_names = (known after apply)
      + node_name               = "proxmox-server"
      + on_boot                 = true
      + protection              = false
      + reboot                  = false
      + scsi_hardware           = "virtio-scsi-pci"
      + started                 = true
      + stop_on_destroy         = false
      + tablet_device           = true
      + template                = false
      + timeout_clone           = 1800
      + timeout_create          = 1800
      + timeout_migrate         = 1800
      + timeout_move_disk       = 1800
      + timeout_reboot          = 1800
      + timeout_shutdown_vm     = 1800
      + timeout_start_vm        = 1800
      + timeout_stop_vm         = 300
      + vm_id                   = (known after apply)

      + agent {
          + enabled = true
          + timeout = "15m"
          + trim    = false
          + type    = "virtio"
        }

      + clone {
          + full    = true
          + retries = 1
          + vm_id   = 9000
        }

      + cpu {
          + cores      = 2
          + hotplugged = 0
          + limit      = 0
          + numa       = false
          + sockets    = 1
          + type       = "qemu64"
          + units      = 1024
        }

      + initialization {
          + datastore_id = "local-lvm"
          + upgrade      = (known after apply)

          + ip_config {
              + ipv4 {
                  + address = "dhcp"
                }
            }

          + user_account {
              + keys     = [
                  + "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC4U9V00OImhe7yH78gqJRD47+DuzLuXcasHnlKtIKSwW28eoAhMXWRckMIxr20zMQ2Lx0TjdQnIXX1cQRRSk+/E6aaT5A5VWoPv3HWEZT7u7yFExyxSv2kP//PaX3HkMZLJ+UIry9fq3Fj3urzy3cK9wqpHwc+ZvOwsCcBtT24uEx+r7ZDPBh+39srqNBm0NcCh4owGkvWYq8NBX4fpWLWloRXzyYyQl2gy4JhwH1H4Ioi2sfUgZrRsWi2jLaURCwz+5oNTMFZDy3Xe1JXYdOdXkwrsDxhqANgO4P8bY9I/m5giHgyQ+CKaEtbvNmf10OIY1l8YYBLxBmwa7C/AvGJP98mIhkLvbsgt5TsoxlGd+nMe2j1GT2F7YKKXf0iqSxPYtAGhNUPbBUdJWbdbiUKKW4OpHv3m7Q8P8NzRYcoYAFzh0eXvFj4xXumwG25s3o4pBVDcgpY5BHcY8PLZiJbUK1tJgSEt2OreaANKTHj5oeHQJ1YD5q09p0iNX9qFNs= desmondfowler14@gmail.com",
                ]
              + username = "ubuntu"
            }
        }

      + memory {
          + dedicated      = 2048
          + floating       = 0
          + keep_hugepages = false
          + shared         = 0
        }

      + network_device {
          + bridge      = "vmbr0"
          + enabled     = true
          + firewall    = false
          + mac_address = (known after apply)
          + model       = "virtio"
          + mtu         = 0
          + queues      = 0
          + rate_limit  = 0
          + vlan_id     = 0
        }
    }

Plan: 3 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + vm_ip_addresses = [
      + (known after apply),
      + (known after apply),
      + (known after apply),
    ]

─────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.