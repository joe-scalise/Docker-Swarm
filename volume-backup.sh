#!/bin/bash

# prune Docker volumes first
docker volume prune -f

# get all docker volume names
volumes=$(docker volume ls -q)

# loop through all containers
for volume in $volumes
do
  echo "Volume: $volume"

  docker run --rm -v ${volume}:/tmp/${volume} -v /nfs/home:/backup ubuntu tar -C "/tmp/" -P -czf "/backup/${volume}.tar.gz" "${volume}"
  
  done
  echo "-- exiting script ---"