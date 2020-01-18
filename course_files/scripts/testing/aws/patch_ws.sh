#!/bin/bash

# This copies the keys to the Workstation

ssh -i "susetech-k8s-keypair.pem" ec2-user@workstation.susetech.org "sudo zypper ref &&  sudo zypper up -y && sudo reboot"
