resource "tls_private_key" "ssh_host_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

data "local_sensitive_file" "perso_key" {
  filename = var.personal_key
}