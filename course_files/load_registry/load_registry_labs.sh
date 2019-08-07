#!/bin/bash
for IMAGE in $(cat ./labs)
do
   skopeo copy docker://$IMAGE docker://rmt.example.com:5000/$IMAGE
done
