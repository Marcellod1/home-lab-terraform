terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.1-rc3"
    }
  }
  required_version = ">=1.9.4"
}

provider "proxmox" {
  pm_api_url = "https://${var.pve_hostname}/api2/json"
  pm_api_token_id = var.pve_api_token_id
  pm_api_token_secret = var.pve_api_token_secret
}

resource "proxmox_vm_qemu" "pxe-minimal-example" {
    name = "pxe-minimal-example"
    clone = "ubu-noble-template"
    full_clone = true
    target_node = "pve05"
    onboot = true
    sockets = 1
    cores = 4
    memory = 4096
    scsihw = "virtio-scsi-single"
    ciuser = "marcello"
    ipconfig0 = "ip=dhcp,ip6=dhcp"
    sshkeys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDeOJZRkcHPmpq3vRia9z17SgtaVrEm8GHkGLdX4+B8FLpvq9RqQaBkAzXsj4b49qpTdwiwlUg4Gtt0+T7B7IHat7HLsu2rGBjHgQ7QKoSVBXVrha8KvOtSFE/sgAupWGVz/CWegH5QKCrx1xgK6nRvUc37hzsJGn/0ghUlE2IoDDj3EJc02XpMKtJGEXsGS+O8rTTUJo7SE0gloYU5Wg+nToxpN73YNKGGs+wh05x2uKY0o+NkJ693smrvuoh5ZG2tYblLy3f4ZUqWtTXRbqzLCnx3txi9rfV5xYPpY/8hCHPyzq4yiuFdSzXzaxnLJD/wn9BjWiGt+3NjZa8w9k6wzn1+KKp5tOZt9tS8bAiRdDsoH2jzUDkqLeRqduuGVtWZAHPltFBVPd9L0zJIZl86I55JX7ABzyo4JWLfqhysJgUKAxgQrjOexsasb2mfr6zNl8jSCQMtpdgy+RVjiwj50c/05TzW7TBO96iX6YUQjfNP9fcB6lxPwW93opa0f1s9GHxt123H7jbexjcNci8f9A2eLVxM0DwGlaMfAs+yK3cCVQA9HZGqjDTSZ5t5XnNaYB5JddDXyO4nuqYmP2m4Fj4KR4uXc2ArJ/2GSyvNj6L9vUECa86eE7kgxDGuH1Bkr4jCz846LSS6Lx2SQR7kPTvH0mN07PYaqJJl/kKShw== marcello,2023-02-16"

    disks {
        ide {
            ide2 {
                cloudinit {
                    storage = "local-lvm"
                }
            }
        }

        scsi {
          scsi0 {
            disk {
                storage = "local-lvm"
                size = "50G"
            }
          }
        }

    } 

    network {
        bridge    = "vmbr0"
        firewall  = false
        link_down = false
        model     = "virtio"
    }
}