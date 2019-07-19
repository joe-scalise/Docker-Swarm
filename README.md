# Docker-Swarm

This repository is a backup of my Docker Swarm Mode system for self hosting purposes. All the ideas presented in the files here are an amalgamation of several online resources in my quest to learn Docker, and related tooling, over many months time.

My setup had many itterations, but generally what finally worked was to focus on minimizing the amount I relied on configuration file based setups.  Ideally, the goal will be to have a system that can be deployed with minimal host setup.  That means a YAML file to define the stack but staying away from environment files, config files and bind-mounted data directories.  None of this was possible until I learned about Consul, Docker Volumes and Docker Secrets.

Core Stacks and System Highlights:

- **Traefik** w/ Let's Encrypt, **Consul** and **Keycloak** (no config files)
- **Portainer** and **Swarmpit** for management (looking at Weave Scope, Ranger too)
- **Syncthing** to edit files on my laptop, and serve as first line of defence backups
- **Elasticsearch**, **Logstash** and **Kibana** (ELK) stack for log management
- **Whoami** for testing
- Docker swarm mode
- Docker Volumes instead of bind-mounts
- Docker Volumes backed up to NFS file share
- Docker Secrets instead of environment files or variables
- NFS backup scripts via crontab

Apps that I rely upon daily:

- Bookstack
- Bitwarden
- Home Assistant (not in Swarm because of USB devices)

Besides the above daily-use apps, I'm constantly creating new stacks, and am considering sharing this as a private repo (maybe Patreon?), consider it a currated (hording) collection of self-hosted software.

- OpenFaaS 
- Plex w/tools 
- Emby
- Snibox
- 

Links to what I used as inspiration (lots of copying):

- Home Assistant [forum post](https://community.home-assistant.io/t/my-docker-stack/43548)
- Ultimate Home Media Server [blog post](https://www.smarthomebeginner.com/docker-home-media-server-2018-basic/)
- [Funky Penguin's Geek Cookbook](https://geek-cookbook.funkypenguin.co.nz/)
- [Docker Swarm Rocks](https://dockerswarm.rocks/)
