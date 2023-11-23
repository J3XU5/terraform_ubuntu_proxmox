resource "local_file" "pub_key" {
  content  = tls_private_key.ssh_host_key.public_key_openssh
  filename = "${var.instance_name}_pub_key.pub"
}

resource "local_file" "priv_key" {
  content  = tls_private_key.ssh_host_key.private_key_openssh
  filename = "${var.instance_name}_priv_key.pem"
}