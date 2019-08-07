#!/bin/bash
for IMAGE in $(cat ./sock_shop)
do
   skopeo copy docker://$IMAGE docker://rmt.example.com:5000/$IMAGE
done
