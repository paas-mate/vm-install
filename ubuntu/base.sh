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
