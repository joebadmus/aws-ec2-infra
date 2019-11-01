#!/bin/bash
set -e

#do an update
sudo yum update -y

## install Nginx
sudo amazon-linux-extras install epel -y
sudo yum install epel-release
sudo amazon-linux-extras install nginx1.12 -y
sudo service nginx start
