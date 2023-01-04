#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
# network cli
sudo apt-get install -y bridge-utils arping net-tools
sudo apt-get install -y ipvsadm
sudo apt-get install -y iperf3
sudo apt-get install -y qperf
# c language
sudo apt-get install -y cmake
sudo apt-get install -y clang
# java
sudo apt-get install -y openjdk-17-jdk
wget https://github.com/alibaba/arthas/releases/download/arthas-all-3.6.7/arthas-bin.zip
mkdir -p /usr/local/lib/arthas
unzip arthas-bin.zip -d /usr/local/lib/arthas
rm -rf arthas-bin.zip
echo "alias arthas='java -jar /usr/local/lib/arthas/arthas-boot.jar'" >> /etc/bash.bashrc
# ebpf
sudo apt-get install -y linux-tools-$(uname -r) linux-headers-$(uname -r)
# sudo apt-get install -y perf-tools-unstable
sudo apt-get install -y libbpfcc
sudo apt-get install -y bpftrace
# xdp
sudo apt-get install -y clang llvm libelf-dev libpcap-dev gcc-multilib build-essential
# openvswitch
sudo apt-get install -y openvswitch-switch
# helpful command
echo "alias ..='cd ..'" >> /etc/bash.bashrc
echo "alias ...='cd ../..'" >> /etc/bash.bashrc
echo "alias tailf='tail -f'" >> /etc/bash.bashrc
echo "set nu" >> /etc/vim/vimrc
