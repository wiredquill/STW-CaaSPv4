#!/bin/bash

/load the SSh agent and Keys
eval "$(ssh-agent -s)"eval "$(ssh-agent -s)"
ssh-add

//install skuba so you can install CaaS Platform and the kubernetes Client
sudo zypper in -y kubernetes-client skuba


//Create the cluster config file
skuba cluster init --control-plane master.example.com my-cluster

//Bootstrap the cluster with master01 as the only master node
cd my-cluster
skuba node bootstrap --target master.example.com master01

//add worker10 as worker node
skuba node join --role worker --target worker11.example.com worker11

//add worker11 as worker node
skuba node join --role worker --target worker11.example.com worker11

skuba cluster status
