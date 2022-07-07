#!/bin/bash
echo "Updating apt"
sudo apt-get -qq update

echo "Installing dependencies"
sudo apt-get -y install openjdk-11-jdk default-jre gnupg2 apt-transport-https wget > /dev/null 2>&1

echo "Adding apt-keys"
wget https://pkg.jenkins.io/debian-stable/jenkins.io.key && sudo apt-key add jenkins.io.key
echo "deb http://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list

echo "Updating apt-get"
sudo apt-get -qq update

echo "Installing default-java"
sudo apt-get -y install default-jre > /dev/null 2>&1
sudo apt-get -y install default-jdk > /dev/null 2>&1

echo "Installing git"
sudo apt-get -y install git > /dev/null 2>&1

echo "Installing git-ftp"
sudo apt-get -y install git-ftp > /dev/null 2>&1

echo "Installing jenkins"
sudo apt-get -y install jenkins > /dev/null 2>&1
sudo service jenkins start

sleep 1m

echo "Installing Jenkins Plugins"
JENKINSPWD=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)
echo $JENKINSPWD
