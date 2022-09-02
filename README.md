# Pattern for Bastion (SSH) Server Configuration

# Requirements

This pattern uses [terraform-provider-esxi](https://github.com/josenk/terraform-provider-esxi) Terraform provider which requires [ovftool](https://www.vmware.com/support/developer/ovf/) installed locally.
After downloading and installation it is neccessary to add it into `$PATH`:

    ln -s '/Applications/VMware OVF Tool/ovftool' ~/bin/ovftool

# Directory Structure

## /ansible/

Ansible code for server stack provisioning

## /ansible/terraform/

Terraform configuration for VM provisioning based on ESXi

## /reference/

Reference files used when initializing a new project using this pattern. 

Some patterns require existing config files to be in the persistent portion of the project used to customize the functionality managed in the pattern source.

This directory contains those initail sample files used to initialize a new project and helps to establish the base configs that will need to be adjusted for each project.
