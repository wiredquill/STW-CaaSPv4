#!/bin/bash

echo master1.susetech.org
ping -c 1 master1.susetech.org
ping -c 1 master1
echo .
echo worker1.susetech.org
ping -c 1 worker1.susetech.org
ping -c 1 worker1
echo .
echo worker2.susetech.org
ping -c 1 worker2.susetech.org
ping -c 1 worker2

read -p "Press [Enter] key to start update..."

scp  hosts ec2-user@master1.susetech.org:~
scp  hosts ec2-user@worker1.susetech.org:~
scp  hosts ec2-user@worker2.susetech.org:~

#ssh -i "susetech-k8s-keypair.pem" ec2-user@workstation.susetech.org "sudo zypper ref &&  sudo zypper up -y && sudo reboot"
echo master1.susetech.org
ssh ec2-user@master1.susetech.org "sudo zypper ref &&  sudo zypper up -y && sudo cp /home/ec2-user/hosts /etc/hosts && sudo reboot"
read -p "Press [Enter] key to start update..."
echo worker1.susetech.org
ssh ec2-user@worker1.susetech.org "sudo zypper ref &&  sudo zypper up -y && sudo cp /home/ec2-user/hosts /etc/hosts && sudo reboot"
echo worker1.susetech.org
ssh ec2-user@worker2.susetech.org "sudo zypper ref &&  sudo zypper up -y && sudo cp /home/ec2-user/hosts /etc/hosts && sudo reboot"

#ssh -i ec2-user@master1.susetech.org “(sudo zypper ref &&  sudo zypper up -y && sudo cp /home/ec2-user/hosts /etc/hosts && sudo reboot) &>/dev/null &"
#ssh -i ec2-user@worker1.susetech.org “(sudo zypper ref &&  sudo zypper up -y && sudo cp /home/ec2-user/hosts /etc/hosts && sudo reboot) &>/dev/null &"
#ssh -i ec2-user@worker2.susetech.org “(sudo zypper ref &&  sudo zypper up -y && sudo cp /home/ec2-user/hosts /etc/hosts && sudo reboot) &>/dev/null &"
