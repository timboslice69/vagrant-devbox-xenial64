#!/bin/bash

echo "******************************"
echo " Provisioning DEVBOX-XENIAL64 "
echo "******************************"

echo "*** Create Swap File ***"
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

echo "*** Update Apt Lists for software to install ***"
# Setup for MongoDB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
# Setup for Node
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

echo "Update apt-get"
sudo apt-get update

echo "Set Locale"
sudo apt-get install language-pack-UTF-8

echo "*** Install MongoDB ***"
sudo apt-get install -y mongodb-org
sudo service mongod stop
sudo cp /vagrant/vagrant-config/mongod.conf /etc/mongod.conf
sudo service mongod start

echo "*** Install node and npm ***"
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential

echo "*** Set NPM Registry ***"
npm set registry https://registry.npmjs.org/

echo "*** Install Global NPM Packages ***"
sudo npm -g install nodemon

echo "******************************"
echo "Status"
echo "******************************"
echo "*** Available memory"
free -m
echo "*** Software Installed  ***"
echo "Node"
#node --version
echo "NPM"
#npm --version
echo "MongoDB"
mongod --version

