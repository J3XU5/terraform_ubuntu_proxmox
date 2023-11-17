resource "proxmox_vm_qemu" "ubuntu" {
  name        = var.instance_name
  target_node = "hugoravard"
  os_type     = "ubuntu"
  onboot      = true
  tablet      = true
  iso         = var.iso_file

  memory = var.mem_size

  sockets = var.nbSockets
  cores   = var.nbCPU

  scsihw = "virtio-scsi-single"

  sshkeys = tls_private_key.ssh_host_key.private_key_openssh

  disk {
    type    = "scsi"
    storage = "scsi0"
    size    = "10G"
  }
}