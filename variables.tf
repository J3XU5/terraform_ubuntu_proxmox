variable "pm_api_url" {
  default = ""
}
variable "pm_api_token_id" {
  default = ""
}
variable "pm_api_token_secret" {
  default = ""
}
#Path to personal ssh key .pub
variable "personal_key" {
  default = ""
}

variable "ip_addr" {
  default = "192.168.1.150/24"
}

variable "instance_name" {
  default = "defaultname"
}

variable "iso_file" {
  default = ""
}

variable "vmid" {
  default = 0
}

variable "mem_size" {
  default = 4096
}

variable "nbSockets" {
  default = 1
}

variable "nbCPU" {
  default = 2
}

