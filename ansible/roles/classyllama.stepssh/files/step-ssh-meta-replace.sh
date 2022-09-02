#!/usr/bin/env bash
cat /etc/step-ssh-temp.json |sed -r 's/\/bin\/bash/\/bin\/lshell/' > /etc/step-ssh-acl.json
