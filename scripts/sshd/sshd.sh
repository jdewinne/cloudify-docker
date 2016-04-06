#!/bin/bash

SSHD_BUILD_PATH=/scripts/sshd

## Install the SSH server.
yum -y install openssh-server openssh-clients sudo
systemctl enable sshd.service

## Install default SSH key for root and app.
mkdir -p /root/.ssh
chmod 700 /root/.ssh
chown root:root /root/.ssh
cp $SSHD_BUILD_PATH/keys/insecure_key.pub /etc/insecure_key.pub
cp $SSHD_BUILD_PATH/keys/insecure_key /etc/insecure_key
chmod 0644 /etc/insecure_key.pub
chmod 0400 /etc/insecure_key
chown root:root /etc/insecure_key*
cp $SSHD_BUILD_PATH/enable_insecure_key /usr/sbin/
