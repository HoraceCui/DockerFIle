FROM ubuntu:22.04

# 设置非交互模式以避免 tzdata 等软件包在构建时卡住
ENV DEBIAN_FRONTEND=noninteractive

# 安装 ca-certificates，并更新源为上海交大
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y ca-certificates && \
    sed -i 's|http://archive.ubuntu.com/ubuntu/|https://mirror.sjtu.edu.cn/ubuntu/|g' /etc/apt/sources.list && \
    sed -i 's|http://security.ubuntu.com/ubuntu|https://mirror.sjtu.edu.cn/ubuntu|g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get upgrade -y

# 安装一些常用工具，包括 ping 和 sudo
RUN apt-get install -y curl wget vim iputils-ping sudo

# 创建一个新用户 ubuntu，并赋予 sudo 权限
RUN useradd -m -s /bin/bash ubuntu && \
    echo "ubuntu:ubuntu" | chpasswd && \
    adduser ubuntu sudo

# 允许 ubuntu 用户在使用 sudo 时不需要密码
RUN echo "ubuntu ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ubuntu && \
    chmod 440 /etc/sudoers.d/ubuntu

    
# 设置 ubuntu 用户为默认用户
USER ubuntu
# 默认进入 shell
CMD ["/bin/bash"]


# 构建镜像
# docker build -t ubuntu22.04-sjtu .
# 运行容器
# docker run -it --rm ubuntu22.04-sjtu