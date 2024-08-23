#!/bin/bash

# 定义 NODE 名称
NODE_NAME=$(kubectl get nodes | grep master | awk '{print $1}')

# 使用 kubectl 获取 Service 的 NODEIP
NODE_IP=$(kubectl get nodes "$NODE_NAME" -o wide | grep "$NODE_NAME" | awk '{print $6}')

# 检查 NODEIP 是否已获取
if [ -z "$NODE_IP" ]; then
    echo "Failed to get NODEIP"
    exit 1
else
    echo "NODEIP: $NODE_IP"
fi

# 使用获取的 NODEIP 访问 Service
# 假设 Service 暴露了 80 端口
curl http://"$NODE_IP":32180
