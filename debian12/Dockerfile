FROM debian:12

# 设置非交互模式以避免 tzdata 等软件包在构建时卡住
ENV DEBIAN_FRONTEND=noninteractive

# 安装 ca-certificates，并更新源为上海交大
# 安装基础包，配置 deb822 格式的源（覆盖原有）
RUN apt-get update && apt-get upgrade -y&& apt-get install -y ca-certificates apt-transport-https gnupg && \
    sed -i 's|http://deb.debian.org/debian|https://mirror.sjtu.edu.cn/debian|g' /etc/apt/sources.list.d/debian.sources && \
    sed -i 's|http://security.debian.org/debian-security|https://mirror.sjtu.edu.cn/debian-security|g' /etc/apt/sources.list.d/debian.sources && \
    sed -i 's|https://mirror.sjtu.edu.cn/debian-security|https://mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list.d/debian.sources && \
    apt-get update && apt-get upgrade -y

# 安装一些常用工具（可选）
RUN apt-get install -y curl wget vim

# 默认进入 shell
CMD ["/bin/bash"]


# 构建镜像
# docker build -t debian12-sjtu .
# 运行容器
# docker run -it --rm debian12-sjtu