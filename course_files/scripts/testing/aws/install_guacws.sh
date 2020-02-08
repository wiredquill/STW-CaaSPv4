#!/bin/bash

## Build Workstation with Guacamole, RDP and CaaSP workstation code


## install skuba so you can install CaaS Platform and the kubernetes Client
sudo zypper up -y

sudo zypper in -y -t pattern gnome_basic

sudo zypper in -y xrdp yast2-rdp docker

sudo mkdir -p /docker/guac
sudo chmod 777 /docker -R

sudo systemctl enable --now docker
