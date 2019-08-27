#!/bin/bash

# Deploy all stacks in dir except Traefik
docker stack deploy -c $(for i in *.yml; do if [[ ${i%} != "traefik.yml" ]]; then echo ${i%} ${i%.*}; fi; done)