#!/bin/sh

SSH_DIR="/home/proxyuser/.ssh"
KEY_FILE="$SSH_DIR/id_rsa"
CONFIG_FILE="$SSH_DIR/config"


# SOCKS5 代理端口（默认 1080，可通过环境变量 SOCKS_PORT 设置）
SOCKS_PORT="${SOCKS_PORT:-1080}"


# 检查密钥和配置是否挂载
if [ ! -f "$KEY_FILE" ] || [ ! -f "$CONFIG_FILE" ]; then
  echo "Error: id_rsa or config not found in $SSH_DIR"
  exit 1
fi

chmod 600 "$KEY_FILE"
chmod 600 ~/.ssh/config
chmod 700 "$SSH_DIR"

# 无限循环自动重连
while true; do
  echo "Starting SSH SOCKS5 proxy..."
  ssh -N -D 0.0.0.0:"$SOCKS_PORT" -F "$CONFIG_FILE" target_host

  echo "SSH exited. Retrying in 10 seconds..."
  sleep 10
done