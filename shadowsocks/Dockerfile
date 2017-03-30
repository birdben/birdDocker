############################################
# version : birdben/shadowsocks:v1
# desc : 当前版本安装的shadowsocks
############################################
# 设置继承自我们创建的 tools 镜像
FROM birdben/tools:v1

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

# 设置环境变量，所有操作都是非交互式的
ENV DEBIAN_FRONTEND noninteractive
ENV SUPERVISOR_LOG_DIR=/var/log/supervisor
ENV SHADOWSOCKS_LOG_DIR=/var/log/shadowsocks

# Add a user and make dirs
RUN set -x \
    && mkdir -p $SUPERVISOR_LOG_DIR \
    && mkdir -p $SHADOWSOCKS_LOG_DIR

# 替换 sources.list 的配置文件，并复制配置文件到对应目录下面。
# 这里使用的AWS国内的源，也可以替换成其他的源（例如：阿里云的源）
COPY sources.list /etc/apt/sources.list

# 添加 supervisord 的配置文件，并复制配置文件到对应目录下面。（supervisord.conf文件和Dockerfile文件在同一路径）
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN sudo rm -rf /var/lib/apt/lists/*
RUN sudo apt-get update

RUN sudo apt-get -y install python-pip
RUN sudo pip install --upgrade pip
RUN sudo pip install shadowsocks

# /Users/yunyu/workspace_git/birdDocker/shadowsocks/logs/supervisor:/var/log/supervisor
# /Users/yunyu/workspace_git/birdDocker/shadowsocks/logs/shadowsocks:/var/log/shadowsocks
# 这里挂载的路径是birdTracker项目的目录
VOLUME ["/var/log/supervisor"]
VOLUME ["/var/log/shadowsocks"]
VOLUME ["/etc/shadowsocks"]

USER root

# 容器需要开放Shadowsocks的443端口
EXPOSE 443

# 执行run.sh文件
# CMD ["/run.sh"]
# 执行supervisord来同时执行多个命令，使用 supervisord 的可执行路径启动服务。
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
