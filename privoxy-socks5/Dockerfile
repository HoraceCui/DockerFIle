FROM alpine:latest

RUN apk add --no-cache privoxy

WORKDIR /etc/privoxy

# 拷贝模板配置和启动脚本
COPY privoxy/config.template /etc/privoxy/config.template
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8118

# 健康检查：每 10 秒请求一次 HTTP 代理，看是否返回 407（Proxy Authentication Required）或 403（正常拦截）
HEALTHCHECK --interval=10s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -q --proxy=on -e use_proxy=yes -e http_proxy=http://127.0.0.1:8118 http://example.com -O /dev/null || exit 1

ENTRYPOINT ["/entrypoint.sh"]
