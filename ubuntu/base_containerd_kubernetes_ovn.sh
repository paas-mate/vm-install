#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
wget -q https://raw.githubusercontent.com/kubeovn/kube-ovn/master/dist/images/install.sh
ctr -n k8s.io images pull kubeovn/kube-ovn:v1.11.0
