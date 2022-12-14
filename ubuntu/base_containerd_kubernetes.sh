#!/bin/bash

DIR="$( cd "$( dirname "$0"  )" && pwd  )"
export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -y apt-transport-https ca-certificates curl
# docker image registry
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# kubernetes image
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y containerd.io
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install -y helm
# modprobe
sudo modprobe overlay
echo "overlay" > /etc/modules-load.d/overlay.conf
sudo modprobe br_netfilter
echo "br_netfilter" > /etc/modules-load.d/br_netfilter.conf
echo "net.bridge.bridge-nf-call-ip6tables=1" >> /etc/sysctl.d/kubernetes.conf
echo "net.bridge.bridge-nf-call-iptables=1" >> /etc/sysctl.d/kubernetes.conf
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.d/kubernetes.conf
sudo sysctl --system
mkdir -p /etc/containerd
containerd config default > /etc/containerd/config.toml
systemctl restart containerd
# pre download kubernetes images
kubeadm config images pull
wget -q https://github.com/Shoothzj/vm-dashboard/releases/download/latest/vm-dashboard.zip
unzip vm-dashboard.zip
mv dist /opt/vm-dashboard
rm -rf vm-dashboard.zip
cp $DIR/vm-dashboard.service /etc/systemd/system/vm-dashboard.service
# manual modify /etc/containerd/config.toml sandbox_image to kubeadm config images
