#!/bin/sh

# 使用默认端口 1080，除非传入了 SOCKS_PORT 环境变量
SOCKS_PORT=${SOCKS_PORT:-1080}

# 替换模板配置中的占位符为实际端口
sed "s|__SOCKS_PORT__|$SOCKS_PORT|g" /etc/sockd/sockd.conf.template > /etc/sockd/sockd.conf

echo "🔧 Starting Dante SOCKS5 server on port $SOCKS_PORT"
exec sockd -f /etc/sockd/sockd.conf
