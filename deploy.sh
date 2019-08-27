#!/bin/bash

# Deploy all stacks in dir except Traefik
# This is not working
docker stack deploy -c $(for i in *.yml; do echo ${i%} ${i%.*}; done)