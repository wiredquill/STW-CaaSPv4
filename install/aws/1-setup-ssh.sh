#!/bin/bash

cp ~/STW-CaaSPv4/install/aws/susetech-k8s-keypair.pem ~/.ssh
sudo chown ec2-user:users ~/.ssh/susetech-k8s-keypair.pem
sudo chmod 600 ec2-user:users ~/.ssh/susetech-k8s-keypair.pem
eval $(ssh-agent -s)
ssh-add
ssh-add ~/.ssh/susetech-k8s-keypair.pem