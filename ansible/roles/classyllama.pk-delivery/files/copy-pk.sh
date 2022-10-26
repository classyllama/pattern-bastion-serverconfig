#!/bin/bash

SSHPATH=/home/${PAM_USER}/.ssh/
MCAUTHTOKEN=/home/${PAM_USER}/.magento-cloud/.session/sess-cli-default/

# Check if ~/.ssh exists, otherwise create it
if [ ! -d ${SSHPATH} ]; then
  mkdir ${SSHPATH}
  chown ${PAM_USER}.${PAM_USER} ${SSHPATH}
  chmod 700 ${SSHPATH}
fi

echo "`date +"%F %H:%M:%S"` ${PAM_USER} logged in, copying private keys" >> /var/log/copy-pk.log
cp -rv /root/pks/id_* ${SSHPATH}
chown ${PAM_USER}.${PAM_USER} ${SSHPATH}/id_*
ln -s ${SSHPATH}/id_*_production ${SSHPATH}/id_ed25519
chmod 400 ${SSHPATH}/id_*

# ECE Api Token (Magento-Cloud CLI)

if [[ -f '/root/pks/api-token' ]]; then

  # Check if ~/.magento-cloud/.session/sess-cli-default/ exists, otherwise create it
  if [ ! -d ${MCAUTHTOKEN} ]; then
    mkdir -p ${MCAUTHTOKEN}
    chown ${PAM_USER}.${PAM_USER} ${MCAUTHTOKEN}
    chown ${PAM_USER}.${PAM_USER} "${MCAUTHTOKEN%/*/}/"
    chown ${PAM_USER}.${PAM_USER} "${MCAUTHTOKEN%/*/*/}/"
    chmod 700 ${MCAUTHTOKEN}
  fi

  echo "`date +"%F %H:%M:%S"` ${PAM_USER} logged in, copying ECE Token" >> /var/log/copy-pk.log
  cp -rv /root/pks/api-token ${MCAUTHTOKEN}
  chown ${PAM_USER}.${PAM_USER} ${MCAUTHTOKEN}/api-token
  chmod 400 ${MCAUTHTOKEN}/api-token

fi
