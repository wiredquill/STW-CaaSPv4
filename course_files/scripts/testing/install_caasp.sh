#!/bin/bash

## load the SSh agent and Keys *This is now done in the setup-keys.sh file
## eval "$(ssh-agent -s)"eval "$(ssh-agent -s)"
## ssh-add

## install skuba so you can install CaaS Platform and the kubernetes Client
sudo zypper in -y -t pattern SUSE-CaaSP-Management


## Create the cluster config file
echo Creating Cluster Config
skuba cluster init --control-plane master.example.com my-cluster

## Bootstrap the cluster with master01 as the only master node
echo Bootstrapping Cluster
cd my-cluster
skuba node bootstrap -v5 --target master.example.com master01
sleep 15s

## add worker10 as worker node
echo Adding worker10
skuba node join -v5 --role worker --target worker10.example.com worker10
sleep 15s

## add worker11 as worker node
echo Adding worker10
skuba node join -v5 --role worker --target worker11.example.com worker11

skuba cluster status

mkdir ~/.kube
cp ~/my-cluster/admin.conf ~/.kube/config
