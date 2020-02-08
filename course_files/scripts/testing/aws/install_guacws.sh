#!/bin/bash

## Build Workstation with Guacamole, RDP and CaaSP workstation code


## install skuba so you can install CaaS Platform and the kubernetes Client
sudo zypper up -y

sudo zypper in -y -t pattern gnome_basic

sudo zypper in -y xrdp yast2-rpd docker

sudo mkdir -p /docker/guac
sudo chmod 777 /docker -R
