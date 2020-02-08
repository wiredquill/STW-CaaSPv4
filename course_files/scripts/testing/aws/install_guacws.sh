#!/bin/bash

## Build Workstation with Guacamole, RDP and CaaSP workstation code


## install skuba so you can install CaaS Platform and the kubernetes Client
sudo zypper up -y

sudo zypper in -y -t pattern patterns-gnome-gnome_basic

sudo zypper in -y Raspberry xrdp yast2-rpd docker

sudo mkdir -p /docker/guac 
