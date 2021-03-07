#!/bin/bash
apt-add-repository ppa:ansible/ansible
apt update
apt install ansible
echo "Welcome to Ansible 101!"