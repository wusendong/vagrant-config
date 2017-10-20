#!/bin/bash
set -e

# install kubeadm
docker run -it \
	-v /etc:/rootfs/etc \
	-v /opt:/rootfs/opt \
	-v /usr/bin:/rootfs/usr/bin \
	xakra/kubeadm-installer:0.4.5 ubuntu install

sudo systemctl daemon-reload
sudo systemctl enable docker kubelet
sudo systemctl restart docker kubelet

# init kubenetes classter
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --token-ttl 0 

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# install flannel pod network
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.9.0/Documentation/kube-flannel.yml

# enable schedule pods on the master
kubectl taint nodes --all node-role.kubernetes.io/master-