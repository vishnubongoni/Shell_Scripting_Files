#!/bin/bash
#
#
##########################
#Author:Vishnu
#Date: 12/05/2025
#
#This is to script that automatically provisions and configure fresh  linux servers
#
#Version:v1
############################


#set variables
USERNAME="demouser"
PASSWORD="Samplepassword123"
WEB_SERVER="nginx"

# updating packing lists...
echo "Updating packages lists...."
sudo apt update -y 

#Install Essential packages
echo "Installing essential packages...."
sudo apt install -y curl wget vim git

#Create new user
echo "Creating User: $USERNAME"
sudo adduser  --disabled-password $USERNAME
echo "$USERNAME:$PASSWORD" | sudo chpasswd


#Install webserver
echo "Installing Webserver... $WEB_SERVER.."
sudo apt install -y $WEB_SERVER
sudo systemctl enable --now $WEB_SERVER


#Install Firewalls
echo "Installing and enabling firewall...."
sudo apt install -y ufw
sudo ufw allow ssh
sudo ufw enable

echo "Server Setup Complete..."

