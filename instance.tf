resource "proxmox_vm_qemu" "ubuntu" {
  name        = var.instance_name
  target_node = "hugoravard"
  desc        = "ubuntu-desktop-computer"
  os_type     = "cloud-init"
  clone       = "ubuntu-ci"
  vmid = var.vmid

  memory = var.mem_size

  sockets = var.nbSockets
  cores   = var.nbCPU

  ciuser     = "user"
  cipassword = "user"

  ssh_user = "user"
  sshkeys  = "${tls_private_key.ssh_host_key.public_key_openssh}\n${data.local_sensitive_file.perso_key.content}"

  scsihw = "virtio-scsi-pci"

  disk {
    type    = "scsi"
    storage = "data"
    size    = "10G"
    slot = 2
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }
  ipconfig0 = "ip=${var.ip_addr}"

  vga {
    type = "serial0"
  }

  serial {
    type = "socket"
    id   = 0
  }
}