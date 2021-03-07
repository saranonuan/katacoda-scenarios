#!/bin/bash
echo "Preparing Ansible 101 lab"
mkdir -p /root/labansible101
cd /root/labansible101
git clone https://github.com/saranonuan/kmitl-sdte-ansible-lab.git .
rm -rf .git
clear
echo "Welcome to Ansible 101 Lab!"
pwd
ls -la
ansible --version
