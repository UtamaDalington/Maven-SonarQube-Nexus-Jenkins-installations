#!/bin/bash
# Update system
apt-get update -y
apt-get upgrade -y
# Install dependencies
apt-get install -y ca-certificates curl gnupg lsb-release
# Add Docker’s official GPG key
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg
# Add Docker repository for Ubuntu 24.04 (noble)
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu noble stable" \
  | tee /etc/apt/sources.list.d/docker.list > /dev/null
# Update and install Docker Engine
apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# Enable and start Docker service
systemctl enable docker
systemctl start docker
# Add ubuntu user to docker group (so you don’t need sudo)
usermod -aG docker ubuntu