FROM debian:12

# 设置非交互模式以避免 tzdata 等软件包在构建时卡住
ENV DEBIAN_FRONTEND=noninteractive

# 安装 ca-certificates，并更新源为上海交大
# 安装基础包，配置 deb822 格式的源（覆盖原有）
RUN apt-get update && apt-get upgrade -y&& apt-get install -y ca-certificates apt-transport-https gnupg curl wget vim nano openssh-client iputils-ping && \
    sed -i 's|http://deb.debian.org/debian|https://mirror.sjtu.edu.cn/debian|g' /etc/apt/sources.list.d/debian.sources && \
    sed -i 's|http://security.debian.org/debian-security|https://mirror.sjtu.edu.cn/debian-security|g' /etc/apt/sources.list.d/debian.sources && \
    sed -i 's|https://mirror.sjtu.edu.cn/debian-security|https://mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list.d/debian.sources && \
    apt-get update && apt-get upgrade -y

# 创建一个新用户 ubuntu，并赋予 sudo 权限
RUN useradd -m -s /bin/bash ubuntu && \
    echo "ubuntu:ubuntu" | chpasswd && \
    adduser ubuntu sudo

# 允许 ubuntu 用户在使用 sudo 时不需要密码
RUN echo "ubuntu ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ubuntu && \
    chmod 440 /etc/sudoers.d/ubuntu

# 设置工作目录为用户主目录
WORKDIR /home/ubuntu
    
# 设置 ubuntu 用户为默认用户
USER ubuntu
# 默认进入 shell
CMD ["/bin/bash"]


# 构建镜像
# docker build -t debian12-sjtu .
# 运行容器
# docker run -it --rm debian12-sjtu