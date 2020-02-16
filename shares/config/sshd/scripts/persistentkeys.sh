#!/bin/bash

cp /config/sshd/keys/ssh_host_ed25519_key /etc/ssh
cp /config/sshd/keys/ssh_host_rsa_key /etc/ssh
chmod 600 /etc/ssh/ssh_host_rsa_key
chmod 600 /etc/ssh/ssh_host_ed25519_key
