FROM ubuntu:22.04

# 设置非交互模式以避免 tzdata 等软件包在构建时卡住
ENV DEBIAN_FRONTEND=noninteractive

# 替换 APT 源为上海交大镜像
RUN sed -i 's|http://archive.ubuntu.com/ubuntu/|https://mirror.sjtu.edu.cn/ubuntu/|g' /etc/apt/sources.list && \
    sed -i 's|http://security.ubuntu.com/ubuntu|https://mirror.sjtu.edu.cn/ubuntu|g' /etc/apt/sources.list && \
    apt-get update && apt-get upgrade -y

# 安装一些常用工具（可选）
RUN apt-get install -y curl wget vim

# 默认进入 shell
CMD ["/bin/bash"]


# 构建镜像
# docker build -t ubuntu22.04-sjtu .
# 运行容器
# docker run -it --rm ubuntu22.04-sjtu