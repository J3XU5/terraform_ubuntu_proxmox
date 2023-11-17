resource "tls_private_key" "ssh_host_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}