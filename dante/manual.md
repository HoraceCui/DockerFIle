构建镜像

docker build -t dante-socks5 .

✅ 运行示例
默认端口（1080）：

docker run -d --name dante -p 1080:1080 dante-socks5

指定端口（如 1086）：

docker run -d --name dante -p 1086:1086 -e SOCKS_PORT=1086 dante-socks5

✅ 测试 SOCKS5 服务（以 curl 为例）

curl --socks5 127.0.0.1:1080 http://example.com