# Ansible Role: Magento-Cloud-Bastion

This role provides 'magento-cloud' utility for bastion servers 

## Requirements

- PHP

## Role Variables

None

## Dependencies

None.

## Example Playbook

    - hosts: all
      roles:
         - { role: classyllama.mcb, tags: mcb, when: use_classyllama_mcb | default(false) }

## License

This work is licensed under the MIT license. See LICENSE file for details.
