# Ansible Role: PK-Delivery

This role provides script which populate .ssh directories for newly created users (on first login) with the content from /root/pks/ directory. 

## Requirements

None.

## Role Variables

None.

## Dependencies

None.

## Example Playbook

    - hosts: all
      roles:
         - { role: classyllama.pk-delivery, tags: pk-delivery, when: use_classyllama_pk_delivery | default(false) }

## License

This work is licensed under the MIT license. See LICENSE file for details.
