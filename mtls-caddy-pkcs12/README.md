# mTLS with Caddy (PKCS#12 Client Certs)

该项目使用自签名 CA 证书和 PKCS#12 格式的客户端证书，结合 Caddy 实现双向 TLS (mTLS) 身份认证。

## 📁 目录结构

mtls-caddy-pkcs12/
├── certs/                      # 存放所有证书和密钥
├── generate-certs.sh           # 生成 CA, Server, Client 证书 (含 PKCS#12)
├── Caddyfile                   # Caddy 配置文件
├── docker-compose.yml          # 启动 Caddy 的 Docker Compose 文件
├── Dockerfile                  # 构建镜像生成证书并运行 Caddy
└── README.md                   # 项目说明文件


~~~

## 🚀 使用方法

### 1. 生成证书 构建 Docker 镜像：

```bash
mkdir -p ./certs
chmod u+w ./certs
chmod +x generate-certs.sh
./generate-certs.sh

docker build -t mtls-caddy .
~~~

2. 启动 Caddy 服务 运行 Docker 容器：
~~~
docker run -d -p 443:443 --name caddy-mtls mtls-caddy
docker-compose up -d
~~~
3. 测试访问 使用带有客户端证书的 curl 或浏览器访问服务，确认是否正确启用了 mTLS。

bash
复制
编辑

~~~
curl --cert-type P12 --cert certs/client.p12: --key certs/client.key https://localhost --insecure
curl --cert-type P12 --cert certs/client.p12: --key certs/client.key https://localhost --insecure


~~~