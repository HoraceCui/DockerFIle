运行容器，动态指定 SOCKS5 地址：

docker run -d --name privoxy \
  -p 8118:8118 \
  -e SOCKS5_ADDR=192.168.1.100:1086 \
  privoxy-dynamic

如果不指定 SOCKS5_ADDR，则默认使用 127.0.0.1:1080。


查看日志：

docker logs -f privoxy

查看健康状态：

docker inspect --format='{{json .State.Health}}' privoxy | jq