#!/bin/bash

# Install curl 
install_curl(){
    sudo apt install curl -y
}

# Install wget
install_wget(){
    sudo apt install wget -y
}

# Install nginx
install_nginx(){
    sudo apt-get install nginx -y
}


# Install docker
install_docker(){
    # Docker
    wget -qO- https://get.docker.com/ | sh
    # Post installation
    sudo groupadd docker
    sudo usermod -aG docker $USER
}

# Docker-compose
install_docker_compose(){
    # Docker Compose
    COMPOSE_VERSION=`git ls-remote https://github.com/docker/compose | grep refs/tags | grep -oE "[0-9]+\.[0-9][0-9]+\.[0-9]+$" | sort --version-sort | tail -n 1`
    sudo sh -c "curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
    sudo chmod +x /usr/local/bin/docker-compose
    sudo sh -c "curl -L https://raw.githubusercontent.com/docker/compose/${COMPOSE_VERSION}/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"

}

command_exists() {
	command -v "$@" > /dev/null 2>&1
}

# Check if curl exist
if ! command_exists curl; then
    "Installing cURL"
    install_curl
fi

# Check if wget exist
if ! command_exists wget; then
    "Installling wget"
    install_wget
fi

# Check if nginx exist
if ! command_exists nginx; then
    "Installing nginx"
    install_nginx
fi

# Check if docker exist
if ! command_exists docker; then
    "Installing docker ..."
    install_docker
fi

# Check if docker-compose exist
if ! command_exists docker-compose; then
    "Installing docker-compose ..."
    install_docker_compose
fi

