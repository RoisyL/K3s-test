#!/bin/bash

# 定义 Service 名称
SERVICE_NAME="nginx-service"

# 使用 kubectl 获取 Service 的 ClusterIP
CLUSTER_IP=$(kubectl get svc "$SERVICE_NAME" -o jsonpath='{.spec.CLUSTER-IP}')

# 检查 ClusterIP 是否已获取
if [ -z "$CLUSTER_IP" ]; then
    echo "Failed to get ClusterIP for service $SERVICE_NAME"
    exit 1
else
    echo "ClusterIP: $CLUSTER_IP"
fi

# 使用获取的 ClusterIP 访问 Service
# 假设 Service 暴露了 80 端口
curl "$CLUSTER_IP":80
