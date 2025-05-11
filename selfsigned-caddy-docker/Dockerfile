# 基于 Alpine 镜像
FROM alpine:3.18

# 安装 OpenSSL 和 bash
RUN apk add --no-cache openssl bash

# 设置工作目录
WORKDIR /app

# 复制生成证书脚本
COPY generate-cert.sh /app/generate-cert.sh

# 赋予执行权限
RUN chmod +x /app/generate-cert.sh

# 运行证书生成脚本
RUN /app/generate-cert.sh

# 设置证书路径
VOLUME ["/app/certs"]

# 设置默认命令
CMD ["bash"]
