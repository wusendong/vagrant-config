
#!/bin/bash

sudo mkdir -p /vagrant/data
# sudo ln -s /vagrant/data/docker /var/lib/docker

# sudo cp /vagrant/apt.sources.list /etc/apt/sources.list
echo Installing docker
# curl -sSL http://acs-public-mirror.oss-cn-hangzhou.aliyuncs.com/docker-engine/internet | sed 's/apt-get install -y -q docker-engine/apt-get install -y -q docker-engine=1.12.6-0~ubuntu-xenial/g' | sh -
sudo curl -sSL https://github.com/gitlawr/install-docker/blob/1.0/1.13.1.sh?raw=true | sh
sudo usermod -aG docker ubuntu

# sudo mkdir -p /etc/docker
# sudo tee /etc/docker/daemon.json <<-'EOF'
# {
#   "registry-mirrors": ["https://qtm2k3j2.mirror.aliyuncs.com"]
# }
# EOF

# sudo mkdir -p /etc/systemd/system/docker.service.d
# sudo tee /etc/systemd/system/docker.service.d/http-proxy.conf <<-'EOF'
# [Service]
# Environment="HTTP_PROXY=http://172.22.101.1:1087/"
# EOF

sudo systemctl daemon-reload
sudo systemctl restart docker
