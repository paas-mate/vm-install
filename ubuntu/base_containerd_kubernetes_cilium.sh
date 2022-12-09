#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
ctr -n k8s.io images pull quay.io/cilium/cilium:v1.12.4
ctr -n k8s.io images pull quay.io/cilium/operator-generic:v1.12.4
