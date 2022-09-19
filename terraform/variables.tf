variable "esxi_host" {
  default = "10.19.1.40"
}

variable "esxi_sshport" {
  default = "22"
}

variable "esxi_sslport" {
  default = "443"
}

variable "esxi_template" {
  default = "bastion-template"
}

variable "esxi_netname" {
  default = "DATA vLAN"
}

variable "esxi_diskstore" {
  default = "datastore1"
}

variable "esxi_username" {
  default = ""
}

variable "esxi_password" {
  default = ""
}

variable "esxi_bastionname" {
  default = ""
}

variable "esxi_numvcpus" {
  default = "2"
}

variable "esxi_memsize" {
  default = "1024M"
}

variable "esxi_power" {
  default = "on"
}
