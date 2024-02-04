resource "proxmox_vm_qemu" "ubuntu" {
  name        = var.instance_name
  target_node = "hugoravard"
  desc        = "justTesting"
  os_type     = "cloud-init"
  clone       = "debian-template"
  vmid        = var.vmid

  memory = var.mem_size

  sockets = var.nbSockets
  cores   = var.nbCPU

  ciuser     = "user"
  cipassword = "user"

  ssh_user = "user"
  sshkeys  = "${tls_private_key.ssh_host_key.public_key_openssh}\n${data.local_sensitive_file.perso_key.content}"

  scsihw = "virtio-scsi-single"

  disk {
    type    = "scsi"
    storage = "data"
    size    = "32G"
    slot    = 2
  }
  cloudinit_cdrom_storage = "data"

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }
  ipconfig0 = "ip=${var.ip_addr}"
}