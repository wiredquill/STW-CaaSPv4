#!/bin/bash

# This removes all of the existing keys on your workstation

ssh-keygen -R    worker1.susetech.org
ssh-keygen -R    worker2.susetech.org
ssh-keygen -R    master1.susetech.org
ssh-keygen -R    ws.susetech.org
ssh-keygen -R    workstation.susetech.org

pause
scp -i "susetech-k8s-keypair.pem" certs/susetech-k8s-keypair.pub ec2-user@ws.susetech.org:/home/ec2-user/.ssh/id_rsa.pub

pause
scp -i "susetech-k8s-keypair.pem" certs/susetech-k8s-keypair.pem ec2-user@ws.susetech.org:/home/ec2-user/.ssh/id_rsa.pem

# ssh -i "susetech-k8s-keypair.pem" ec2-user@workstation.susetech.org “(sudo zypper ref &&  sudo zypper up -y && sudo cp /home/ec2-user/hosts /etc/hosts && sudo reboot) &>/dev/null &"