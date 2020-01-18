#!/bin/bash

scp -i  hosts ec2-user@master1.susetech.org:~
scp -i  hosts ec2-user@worker1.susetech.org:~
scp -i  hosts ec2-user@worker2.susetech.org:~

#ssh -i "susetech-k8s-keypair.pem" ec2-user@workstation.susetech.org "sudo zypper ref &&  sudo zypper up -y && sudo reboot"

ssh -i ec2-user@master1.susetech.org “sudo zypper ref &&  sudo zypper up -y && sudo cp /home/ec2-user/hosts /etc/hosts && sudo reboot"
ssh -i ec2-user@worker1.susetech.org “(sudo zypper ref &&  sudo zypper up -y && sudo cp /home/ec2-user/hosts /etc/hosts && sudo reboot"
ssh -i ec2-user@worker2.susetech.org “(sudo zypper ref &&  sudo zypper up -y && sudo cp /home/ec2-user/hosts /etc/hosts && sudo reboot"

#ssh -i ec2-user@master1.susetech.org “(sudo zypper ref &&  sudo zypper up -y && sudo cp /home/ec2-user/hosts /etc/hosts && sudo reboot) &>/dev/null &"
#ssh -i ec2-user@worker1.susetech.org “(sudo zypper ref &&  sudo zypper up -y && sudo cp /home/ec2-user/hosts /etc/hosts && sudo reboot) &>/dev/null &"
#ssh -i ec2-user@worker2.susetech.org “(sudo zypper ref &&  sudo zypper up -y && sudo cp /home/ec2-user/hosts /etc/hosts && sudo reboot) &>/dev/null &"
