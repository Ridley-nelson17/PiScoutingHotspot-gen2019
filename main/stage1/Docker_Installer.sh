#!/bin/bash

# Requirement
apt update
apt install -y \
    apt-transport-https ca-certificates \
    curl software-properties-common debootstrap qemu-user-static

# Docker CE
curl -fsSL ./main/Certificates/Docker_ubuntu_gpg | apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt update
apt install -y docker-ce

# for Docker
gpasswd -a vagrant main/stage2
