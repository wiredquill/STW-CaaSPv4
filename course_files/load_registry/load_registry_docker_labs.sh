#!/bin/bash
for IMAGE in $(cat ./labs)
do
  docker pull $IMAGE 
  docker image tag  $IMAGE rmt.example.com:5000/$IMAGE
  docker push rmt.example.com:5000/$IMAGE
done