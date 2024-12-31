#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

sudo systemctl start docker
sudo systemctl enable docker

sudo apt-get install -y git fontconfig openjdk-17-jre

wget http://ftp.debian.org/debian/pool/main/i/init-system-helpers/init-system-helpers_1.60_all.deb
sudo dpkg -i init-system-helpers_1.60_all.deb
sudo apt-get install -f


sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update
sudo apt-get install jenkins 


sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo ufw allow 8080


## Run Jenkins container
#mkdir -p /home/oren2Bcloud/jenkins_home
#chmod -R 775 /home/your-user/jenkins_home
#sudo chown -R 1000:1000 /home/oren2Bcloud/jenkins_home
#sudo docker run -d -p 8080:8080 -v /home/oren2Bcloud/jenkins_home:/var/jenkins_home --name jenkins jenkins/jenkins:lts
#echo "Jenkins is running. To get the initial Jenkins admin password, run:"
#echo "sudo docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword"