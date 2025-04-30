FROM alpine:latest

RUN apk add --no-cache openssh

RUN adduser -D proxyuser
USER proxyuser

# SSH目录
RUN mkdir -p /home/proxyuser/.ssh
WORKDIR /home/proxyuser

# 启动脚本  
COPY --chown=proxyuser:proxyuser entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]