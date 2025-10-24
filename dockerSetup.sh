#!/bin/bash

# Script to install and setup docker on Rocky Linux - dnf based package systems

# Exit immediately if a command fails
set -e 

echo "Deleting all prev docker packages"
sudo dnf remove -y \
  docker \
  docker-client \
  docker-client-latest \
  docker-common \
  docker-latest \
  docker-latest-logrotate \
  docker-logrotate \
  docker-engine \
  podman \
  runc || true

echo "Installing DNF plugins"
sudo dnf -y install dnf-plugins-core

echo "Adding docker repo to package manager and installing docker"
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


echo "Enable docker"
sudo systemctl enable --now docker

echo "Adding cuirrent user to docker group"
sudo usermod -aG docker $USER
newgrp docker <<subscpt
echo "Runing hello world container"
docker run hello-world
subscpt

echo "Installation successful"