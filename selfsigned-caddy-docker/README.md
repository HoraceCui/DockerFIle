# 自签名 HTTPS 反向代理示例

## 项目说明

本项目演示了如何使用自签名 SSL 证书配置 Caddy 作为反向代理服务器，并通过 Docker Compose 管理服务。

## 使用方法

1. 生成自签名证书：

   ```bash
   mkdir -p ./certs
   chmod u+w ./certs
   chmod +x generate-cert.sh
   ./generate-cert.sh
   ```

2. 启动服务：

   ```bash
   docker-compose up -d
   ```

3. 访问服务：

   - https://localhost
   - https://127.0.0.1
   - https://[::1]
   - https://192.168.31.1
   - https://[2001:db8::1]

   注意：由于使用的是自签名证书，浏览器可能会提示不受信任的连接，继续访问即可。
