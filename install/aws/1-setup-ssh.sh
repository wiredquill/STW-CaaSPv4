#!/bin/bash

cp ~/STW-CaaSPv4/install/aws/susetech-k8s-keypair.pem ~/.ssh
eval $(ssh-agent -s)
ssh-add
ssh-add ~/.ssh/susetech-k8s-keypair.pem