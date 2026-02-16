#!/bin/bash

# Exit on error
set -e

echo "🚀 Starting installation for Ubuntu 24.04..."

# 1. Update and install core dependencies
sudo apt-get update
sudo apt-get install -y fontconfig openjdk-17-jre software-properties-common curl gnupg git unzip python3-pip

# Verify installation
java --version
python3 --version

# 2. Install Jenkins
echo "📦 Installing Jenkins..."

# Download key and convert to GPG format if necessary
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add the repo with the specific signed-by path
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update
sudo apt-get install -y jenkins

sudo systemctl enable jenkins
sudo systemctl start jenkins

# Verify installation
jenkins --version

# 3. Install Terraform
echo "🏗️ Installing Terraform..."

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg --yes
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update && sudo apt-get install -y terraform

# Verify installation
terraform -version

# 4. Install Snyk CLI
echo "🛡️ Installing Snyk..."

curl -fsSL https://static.snyk.io/cli/latest/snyk-linux -o snyk
sudo chmod +x snyk
sudo mv snyk /usr/local/bin/

# Verify installation
snyk --version

# 5. Install Checkov (via pipx for 24.04 compatibility)
echo "🔍 Installing Checkov..."

sudo apt-get install -y pipx
pipx ensurepath

# Using 'sudo' with pipx isn't recommended, we install it for the current user
pipx install checkov

# Verify installation
checkov --version

echo "------------------------------------------------"
echo "✅ Installation Complete!"
echo "Jenkins Status: $(systemctl is-active jenkins)"
echo "Initial Jenkins Admin Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo "------------------------------------------------"