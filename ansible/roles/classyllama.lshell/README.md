# Ansible Role: Lshell

This role provides 'limited shell / lshell' (https://github.com/ghantoos/lshell) 

## Requirements

This tool requires Python2, which is installed on CentOS 8 / RockyLinux 8 as a dependency by this role.

## Role Variables

See `defaults/main.yml` for details.

## Dependencies

None.

## Example Playbook

    - hosts: all
      roles:
         - { role: classyllama.lshell, tags: lshell, when: use_classyllama_lshell | default(false) }

## License

This work is licensed under the MIT license. See LICENSE file for details.
