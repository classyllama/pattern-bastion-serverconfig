#!/bin/bash

SSHPATH=/home/${PAM_USER}/.ssh/

# Check if ~/.ssh exists, otherwise create it
if [ ! -d ${SSHPATH} ]; then
  mkdir ${SSHPATH}
  chown ${PAM_USER}.${PAM_USER} ${SSHPATH}
  chmod 700 ${SSHPATH}
fi

echo "`date +"%F %H:%M:%S"` ${PAM_USER} logged in, copying private keys" >> /var/log/copy-pk.log
cp -rv /root/pks/id_* ${SSHPATH}
chown ${PAM_USER}.${PAM_USER} ${SSHPATH}/id_*
chmod 400 ${SSHPATH}/id_*
