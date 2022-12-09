#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -y bridge-utils
sudo apt-get install -y cmake
sudo apt-get install -y linux-tools-$(uname -r) linux-headers-$(uname -r)
sudo apt-get install -y perf-tools-unstable
sudo apt-get install -y libbpfcc
sudo apt-get install -y bpftrace
sudo apt-get install -y iperf3
sudo apt-get install -y qperf
sudo apt-get install -y ipvsadm
echo "alias ..='cd ..'" >> /etc/bash.bashrc
echo "alias ...='cd ../..'" >> /etc/bash.bashrc
echo "alias tailf='tail -f'" >> /etc/bash.bashrc
echo "set nu" >> /etc/vim/vimrc
sudo apt-get install -y openjdk-17-jdk
wget https://github.com/alibaba/arthas/releases/download/arthas-all-3.6.6/arthas-bin.zip
mkdir -p /usr/local/lib/arthas
unzip arthas-bin.zip -d /usr/local/lib/arthas
rm -rf arthas-bin.zip
echo "alias arthas='java -jar /usr/local/lib/arthas/arthas-boot.jar'" >> /etc/.bashrc
