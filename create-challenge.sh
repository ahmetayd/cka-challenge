#!/bin/bash
declare -a array=("one" "two")

arraylength=${#array[@]}
for (( i=0; i<${arraylength}; i++ ));
do
kind create cluster --config - << EOF
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
name: ${array[$i]}
nodes:
- role: control-plane
- role: worker
- role: worker
networking:
  disableDefaultCNI: true
EOF
done
