#!/usr/bin/env bash

BASTION_IP=$(cat terraform.tfstate |jq -r '.resources[].instances[].attributes.ip_address')
BASTION_NAME=$(cat terraform.tfstate |jq -r '.resources[].instances[].attributes.guest_name')

cat <<END > ../inventories/${BASTION_NAME}.yml
all:
  children:
    default:
      children:
        cluster:
          hosts:
            ${BASTION_NAME}:
              ansible_host: ${BASTION_IP}
              ansible_user: root
        bastion:
          hosts:
            ${BASTION_NAME}:
END

echo "Bastion name: ${BASTION_NAME} Bastion IP: ${BASTION_IP}"
