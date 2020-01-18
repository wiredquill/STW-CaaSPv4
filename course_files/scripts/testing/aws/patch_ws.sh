#!/bin/bash

# This copies the keys to the Workstation

scp -i "susetech-k8s-keypair.pem" susetech-k8s-keypair.pub ec2-user@workstation.susetech.org:/~
scp -i "susetech-k8s-keypair.pem" susetech-k8s-keypair.pem ec2-user@workstation.susetech.org:/~

ssh -i "susetech-k8s-keypair.pem" ec2-user@workstation.susetech.org "sudo cp /home/ec2-user/susetech-k8s-keypair.pub /home/ec2-user/.ssh/id_rsa.pub"
ssh -i "susetech-k8s-keypair.pem" ec2-user@workstation.susetech.org "sudo cp /home/ec2-user/susetech-k8s-keypair.pem /home/ec2-user/.ssh/id_rsa"

# ssh -i "susetech-k8s-keypair.pem" ec2-user@workstation.susetech.org “(sudo zypper ref &&  sudo zypper up -y && sudo cp /home/ec2-user/hosts /etc/hosts && sudo reboot) &>/dev/null &"

scp -i "susetech-k8s-keypair.pem" hosts ec2-user@workstation.susetech.org:/etc/hosts
ssh -i "susetech-k8s-keypair.pem" ec2-user@workstation.susetech.org "sudo cp ~/hosts /etc/hosts"


ssh -i "susetech-k8s-keypair.pem" ec2-user@workstation.susetech.org "sudo zypper ref &&  sudo zypper up -y && sudo reboot"
