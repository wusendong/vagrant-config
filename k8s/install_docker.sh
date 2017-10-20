#!/bin/bash

sudo mkdir -p /vagrant/data

# sudo cp /vagrant/apt.sources.list /etc/apt/sources.list
echo Installing docker
# curl -sSL http://acs-public-mirror.oss-cn-hangzhou.aliyuncs.com/docker-engine/internet | sed 's/apt-get install -y -q docker-engine/apt-get install -y -q docker-engine=1.12.6-0~ubuntu-xenial/g' | sh -
sudo curl -sSL https://github.com/gitlawr/install-docker/blob/1.0/1.12.6.sh?raw=true | sh
sudo usermod -aG docker ubuntu

sudo systemctl daemon-reload
sudo systemctl restart docker
