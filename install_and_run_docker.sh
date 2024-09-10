#!/bin/bash

# Update system packages
sudo apt update && sudo apt upgrade -y

# Install dependencies for Docker
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker’s official repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update the package database
sudo apt update

# Install Docker
sudo apt install -y docker-ce

# Check Docker status
#sudo systemctl enable docker

# Pull the jupyter/scipy-notebook Docker image
sudo docker pull jupyter/scipy-notebook

# Run the Docker container and mount the specified directory
sudo docker run -p 8888:8888 -v /home/rachappa/Downloads/github/my-data-science-setupandtry:/home/jovyan/work jupyter/scipy-notebook
