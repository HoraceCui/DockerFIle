FROM alpine:latest

# 安装 dante-server
RUN apk add --no-cache dante-server

WORKDIR /etc/sockd

# 拷贝模板配置和启动脚本
COPY dante/sockd.conf.template /etc/sockd/sockd.conf.template
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 1080

ENTRYPOINT ["/entrypoint.sh"]
