#!/bin/bash

# Update system
apt-get update -y
apt-get upgrade -y

# Install Java 11 (LTS)
sudo apt-get install -y openjdk-11-jdk

# Install Apache Maven
apt-get install -y maven 

# Add Jenkins repo key
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add Jenkins repo
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update apt and install Jenkins
apt-get update -y
apt-get install -y jenkins

# Enable and start Jenkins
systemctl enable jenkins
systemctl start jenkins