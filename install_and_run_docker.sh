#!/bin/bash

# Navigate to your Git repository directory
cd /home/rachappa/Downloads/github/my-data-science-setupandtry

# Update system packages
sudo apt update && sudo apt upgrade -y

# Install dependencies for Docker (if not already installed)
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker’s official GPG key (if not already added)
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker’s official repository (if not already added)
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update the package database
sudo apt update

# Install Docker (if not already installed)
sudo apt install -y docker-ce

# Check Docker status
sudo systemctl status docker

# Enable Docker to start on boot (if not already enabled)
#sudo systemctl enable docker

# Pull the jupyter/scipy-notebook Docker image (if not already pulled)
sudo docker pull jupyter/scipy-notebook

# Stop and remove any existing container with the name 'jupyter-notebook'
CONTAINER_ID=$(sudo docker ps -q -f name=jupyter-notebook)
if [ ! -z "$CONTAINER_ID" ]; then
    sudo docker stop $CONTAINER_ID
    sudo docker rm $CONTAINER_ID
fi

# Run the Docker container and mount the Git repository directory
sudo docker run -d -p 8888:8888 -v /home/rachappa/Downloads/github/my-data-science-setupandtry:/home/jovyan/work --name jupyter-notebook jupyter/scipy-notebook
