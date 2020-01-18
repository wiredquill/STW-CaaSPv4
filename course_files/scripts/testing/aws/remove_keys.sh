#!/bin/bash

# This removes all of the existing keys on your workstation

ssh-keygen -R    worker1.susetech.org
ssh-keygen -R    worker2.susetech.org
ssh-keygen -R    master1.susetech.org
ssh-keygen -R    ws.susetech.org
ssh-keygen -R    workstation.susetech.org