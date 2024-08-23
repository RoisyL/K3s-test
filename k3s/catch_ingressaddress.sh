#!/bin/bash

# 使用 kubectl 获取 Ingress 的 address
INGRESS_ADDRESS=$(kubectl get ingress | grep nginx-ingress | awk '{print $4}')

# 检查 INGRESS_ADDRESS 是否已获取
if [ -z "$INGRESS_ADDRESS" ]; then
    echo "Failed to get INGRESS_ADDRESS"
    exit 1
else
    echo "Ingress_ADDRESS: $INGRESS_ADDRESS"
fi

# 使用获取的 INGRESS_ADDRESS 访问 Service
echo 使用获取的 INGRESS_ADDRESS 访问 Service
curl http://"$INGRESS_ADDRESS":80
