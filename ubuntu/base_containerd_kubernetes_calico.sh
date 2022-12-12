#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
wget -q https://raw.githubusercontent.com/projectcalico/calico/v3.24.5/manifests/tigera-operator.yaml
wget -q https://raw.githubusercontent.com/projectcalico/calico/v3.24.5/manifests/custom-resources.yaml
