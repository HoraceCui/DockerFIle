# 使用 Alpine 作为基础镜像
FROM alpine:latest

# 安装 iperf3（使用社区仓库）
RUN apk add --no-cache iperf3

# 默认启动为服务端模式，可通过 docker run 参数覆盖
ENTRYPOINT ["iperf3"]
CMD ["-s"]