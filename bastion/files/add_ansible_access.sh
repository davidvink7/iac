#!/bin/bash
# Script to create additional user if doesn't exist at the boot time and add pub ssh-rsa to passwordless auth
# Author: davidvink7
#
USER=ansible
SSH_RSA="ssh-rsa PASTE_SSH_KEY_HERE"

getent passwd $USER 2 >/dev/null &>1
if [ $? -ne 0 ]; then
  adduser --disabled-password --gecos "" --shell /bin/bash $USER

  echo "$USER ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/99-$USER

  echo "$SSH_RSA" | su - $USER -c "mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"

else
  echo "$USER ALREADY PRESENT"
fi
