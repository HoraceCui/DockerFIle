#!/bin/sh

# 默认 SOCKS5 地址
SOCKS5_ADDR=${SOCKS5_ADDR:-127.0.0.1:1080}

# 替换模板中的 SOCKS5 地址
sed "s|__SOCKS5_ADDR__|$SOCKS5_ADDR|g" /etc/privoxy/config.template > /etc/privoxy/config

# 指定日志文件为 stdout
echo "logfile /dev/stdout" >> /etc/privoxy/config

echo "🔧 Using SOCKS5 proxy at: $SOCKS5_ADDR"
echo "🚀 Starting Privoxy..."

exec privoxy --no-daemon /etc/privoxy/config
