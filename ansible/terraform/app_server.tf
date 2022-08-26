terraform {
  required_version = ">= 0.13"
}

provider "esxi" {
  esxi_hostname      = var.esxi_host
  esxi_hostport      = var.esxi_sshport
  esxi_hostssl       = var.esxi_sslport
  esxi_username      = var.esxi_username
  esxi_password      = var.esxi_password
}

resource "esxi_guest" "bastion" {
  guest_name         = var.esxi_bastionname
  disk_store         = var.esxi_diskstore

  #
  #  Specify an existing guest to clone, an ovf source, or neither to build a bare-metal guest vm.
  #
  # clone_from_vm      = var.esxi_template
  ovf_source        = "var.esxi_diskstore/var.esxi_template"

  network_interfaces {
    virtual_network = var.esxi_netname
  }
}

resource "null_resource" "bastion_provisioning_stack" {

  # Run ansible provisioning playbook on app server
  provisioner "local-exec" {
    command = <<EOF
        ANSIBLE_CONFIG=../ansible.cfg ansible-playbook -i ../inventories/bastion-* ../app.yml
EOF

  }
}
