
**Update:** This repository was updated in June of 2022; after a successful migration but failed documentation of my entire stack in Kubernetes on Ubuntu Server w/MicroK8s.  The hard drive crashed and I don't have the patience to start over.

# Docker-Swarm

This repository is a backup of my Docker swarm mode system for self hosting purposes. All the ideas presented in the files here are an amalgamation of several online resources in my quest to learn Docker and related tooling.

My setup has had many itterations, total rebuilds included.  What worked best for me eventually was staying away from the file system.  That means a YAML file to define the stack but trying to prevent the use of environment files, config files and bind-mounted data directories.  Primarily utilizing Consul, Docker Volumes and Docker Secrets.

Core Stacks and System Highlights:

- **Traefik** stack w/ Let's Encrypt, **Whoami**, **Consul**
- **Portainer** and **Swarmpit** for management
- **Dozzle** for simple viewing of container logs
- **Watchtower** for automatic image updates
- Docker swarm mode
- Docker Volumes instead of bind-mounts
- Docker Volumes backed up to NFS file share
- Docker Secrets instead of environment files or variables
- NFS backup scripts via crontab

Applications I can't live without:

- **Bitwarden**
- **AdGuard Home**
- **Unifi Video**
- **Home Assistant** (running with Docker-Compose because of USB devices)

Links to what I used as inspiration (aka lots of copying):

- Home Assistant [forum post](https://community.home-assistant.io/t/my-docker-stack/43548)
- Ultimate Home Media Server [blog post](https://www.smarthomebeginner.com/docker-home-media-server-2018-basic/)
- [Funky Penguin's Geek Cookbook](https://geek-cookbook.funkypenguin.co.nz/)
- [Docker Swarm Rocks](https://dockerswarm.rocks/)

## Helpful Notes

*More than once I've lost the swarm after updates, where the swarm manager is available but down; this blows away your swarm config so you can start over.*

```
systemctl stop docker
rm -Rf /var/lib/docker/swarm
systemctl start docker
docker swarm init
```

Mounting for backups and media volumes:

```
sudo mount nfs_ip:/volume1/media /nfs/media
sudo mount nfs_ip:/volume1/docker /nfs/home
```

Add an entry to the /etc/fstab file to persist after reboots:

```
nfs_ip:/volume1/media /nfs/media nfs rsize=8192,wsize=8192,timeo=14,intr
nfs_ip:/volume1/docker /nfs/home nfs rsize=8192,wsize=8192,timeo=14,intr
```

## Docker Cheatsheet

Start all stacks in current directory (I gave up before I figured this one out):
 `docker stack deploy -c $(for i in *.yml; do echo ${i%} ${i%.*}; done)`

Remove all stacks:
`docker stack rm $(docker stack ls --format '{{.Name}}')`


## Host Setup

Starting with Ubuntu Server 22.04

Use the `lsb_release -a command` to display the Ubuntu version.



2. Enable the firewall

```
sudo ufw enable
sudo ufw status
```

3. Run updates

```
sudo apt update; sudo apt-get upgrade -y; sudo apt dist-upgrade
```

4. Install Docker

```
curl -fsSL get.docker.com -o get-docker.sh`
sudo sh get-docker.sh`
sudo usermod -a -G docker $USER`
```

5. Install Docker-Compose

Determine latest version by referencing the releases at https://github.com/docker/compose/releases.

```
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
```

```
sudo chmod +x ~/.docker/cli-plugins/docker-compose
```

```
docker-compose version
```

6. Install command-line completion

```
sudo curl \
    -L https://raw.githubusercontent.com/docker/compose/v2.6.0/contrib/completion/bash/docker-compose \
    -o /etc/bash_completion.d/docker-compose
```

7. Setup Docker swarm mode

```
docker swarm init
```

8. Fix iptables vs. UFW issue:

```
sudo nano /etc/default/docker
DOCKER_OPTS="--iptables=false"
sudo systemctl restart docker
```

9. Make data directory & clone this repo

```
mkdir ~/data; cd ~/data
```

```
git clone https://github.com/joe-scalise/Docker-Swarm.git
```

10. Create Docker network

```
docker network create --driver=overlay traefik-public
```

11.

