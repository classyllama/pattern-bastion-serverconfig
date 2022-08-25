# Ansible Role: Lshell

This role provides 'Step SSH' (SmallStep) installation and configuration (https://smallstep.com/docs/ssh).
By default it is designed to provision bastion servers (`classyllama_stepssh_is_bastion` is set to true).

## Requirements

None

## Role Variables

Enable the role:

    use_classyllama_stepssh: true

Provisioning token:

    classyllama_stepssh_token: "token"

If the host is not a bastion (default value):

    classyllama_stepssh_is_bastion: false
    classyllama_stepssh_bastion_host: "bastion.example.org"

See `defaults/main.yml` for details.

## Dependencies

None.

## Example Playbook

    - hosts: all
      roles:
         - { role: classyllama.stepssh, tags: stepssh, when: use_classyllama_stepssh | default(false) }

## License

This work is licensed under the MIT license. See LICENSE file for details.
