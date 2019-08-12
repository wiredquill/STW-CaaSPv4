#!/bin/bash

eval "$(ssh-agent -s)"eval "$(ssh-agent -s)"
ssh-add

sudo zypper in -y kubernetes-client skuba
