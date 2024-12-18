#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

sudo systemctl start docker
sudo systemctl enable docker

sudo apt-get install -y git

# Run Jenkins container
sudo docker run -d -p 8080:8080 --name jenkins jenkins/jenkins:lts
echo "Jenkins is running. To get the initial Jenkins admin password, run:"
echo "sudo docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword"