#!/bin/bash

eval "$(ssh-agent -s)"eval "$(ssh-agent -s)"
ssh-add

zypper in --y kubernetes-client skuba
