# Ansible Role: PK-Delivery

This role provides a script that populates .ssh directories for newly created users (on the first login) with the content from /root/pks/ directory.
Also, it creates .magento-cloud/.session/sess-cli-default/api-token with the content from /root/pks/api-token during each log in.

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
