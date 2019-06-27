# Docker-Swarm

This repository is a backup of my Docker Swarm Mode system for self hosting purposes. All the ideas presented in the files here are an amalgamation of several online resources in my quest to learn Docker, and related tooling, over many months time.

The setup had many itterations because problems, but generally what finally worked was to focus on minimizing the amount I relied on configuration file based setups.  Ideally, the goal will be to have a system that can be deployed with minimal host setup.  That means a YAML file to define the stack but staying away from environment files, config files and bind-mounted data directories.  None of this was possible until I learned about Consul, Docker Volumes and Docker Secrets.

Highlights of the system setup:

- Traefik w/ Let's Encrypt, Consul and Keycloak (no config files)
- Portainer, Swarmpit, Weave Scope, Ranger for management
- Syncthing to edit files on my laptop, and serve as first line of defence backups
- Docker swarm mode
- Docker Volumes instead of bind-mounts
- Docker Volumes backed up to NFS file share
- Docker Secrets instead of environment files or variables

Other apps that I run, really like and rely upon daily:

- Bookstack
- Bitwarden
- OpenFaaS
- Plex
- Home Assistant (not in Swarm because of USB devices)

Links to what I used as inspiration (copied):

- Home Assistant forum post here
- Ultimate Home Media Server
- Funky Penguin's Geek Cookbook
- Docker Swarm Rocks
