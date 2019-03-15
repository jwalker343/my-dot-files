#!/bin/bash

# Enable Sha1 for SSH & Pipe knownhost to /dev/null
# http://linuxcommando.blogspot.com/2008/10/how-to-disable-ssh-host-key-checking.html
mkdir ~/.ssh
echo -e "Host *" >> ~/.ssh/config
echo -e "\t StrictHostKeyChecking no" >> ~/.ssh/config
echo -e "\t UserKnownHostsFile=/dev/null" >> ~/.ssh/config
echo -e "\t KexAlgorithms +diffie-hellman-group1-sha1" >> ~/.ssh/config
