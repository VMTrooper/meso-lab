#!/bin/sh

echo "
192.168.33.10	node1
192.168.33.11	node2
192.168.33.12	node3
192.168.33.13	node4
" | sudo tee -a /etc/hosts

# Need to install epel-release to get pip
sudo yum install -y epel-release

# Need to install pip so that mesos cli prereqs get installed
sudo yum install -y python-pip

# Failed attempts to circumvent Vagrant automatically configuring /etc/hosts
# to resolve the hostname to 127.0.0.1 EACH and EVERY login!!!
#127.0.0.1       localhost localhost.localdomain	localhost4 localhost4.localdomain4
#sudo sed -r "s/127.0.0.1   node. /127.0.0.1   /g" /etc/hosts
#sudo sed -r "s/127.0.0.1   node. /#127.0.0.1   node. /g" /etc/hosts