#!/bin/bash

# Set the hostname
hostnamectl set-hostname docker_instance

# Update the system
dnf update -y

# Install Docker
dnf install docker -y

# Start and enable Docker service
systemctl start docker
systemctl enable docker

# Add the ec2-user to the docker group
usermod -a -G docker ec2-user

dnf install git -y

# Install Docker Compose
curl -SL https://github.com/docker/compose/releases/download/v2.20.3/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Set your GitHub username and token as variables
github_username="*********"
github_token="*********************************"

# Clone the Bookstore Web API repository with username and token
git clone https://${github_username}:${github_token}@github.com/taydinadnan/Dockerization-of-Bookstore-Web-API-Python-Flask-with-MySQL.git

# Change to the cloned directory
cd Dockerization-of-Bookstore-Web-API-Python-Flask-with-MySQL/

# Run docker-compose up
docker-compose up
