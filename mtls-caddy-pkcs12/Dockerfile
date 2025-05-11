# 使用官方的 Caddy 镜像
FROM caddy:2

# 安装 openssl
RUN apk add --no-cache openssl

# 设置工作目录
WORKDIR /app

# 复制生成证书的脚本和配置文件
COPY generate-certs.sh /app/generate-certs.sh
COPY Caddyfile /etc/caddy/Caddyfile

# 创建证书目录
RUN mkdir -p /etc/caddy/certs

# 设置脚本为可执行
RUN chmod +x /app/generate-certs.sh

# 运行生成证书的脚本
RUN /app/generate-certs.sh

# 暴露端口
EXPOSE 443

# 启动 Caddy
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile"]
