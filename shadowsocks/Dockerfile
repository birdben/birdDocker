############################################
# version : birdben/shadowsocks:v2
# desc : 当前版本安装的shadowsocks
############################################
# 设置继承自我们创建的 tools 镜像
FROM birdben/tools:v2

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

# 添加User和Group
RUN groupadd -r ssserver \ 
    && useradd -r -g ssserver ssserver

# 安装Shadowsocks
RUN apt-get update \
    && apt-get -y install python-pip \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --upgrade pip \
    && pip install shadowsocks

# Make dirs and chown
RUN set -x \
    && mkdir -p /etc/shadowsocks \
    && mkdir -p /var/log/shadowsocks \
    && chown -R ssserver:ssserver /etc/shadowsocks \
    && chown -R ssserver:ssserver /var/log/shadowsocks

# /Users/yunyu/workspace_git/birdDocker/shadowsocks/logs/shadowsocks:/var/log/shadowsocks
# 这里挂载的路径是birdTracker项目的目录
VOLUME ["/var/log/shadowsocks"]
VOLUME ["/etc/shadowsocks"]

# 复制docker-entrypoint.sh脚本到/usr/local/bin目录下
COPY docker-entrypoint.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# 当执行docker run shadowsocks就会执行docker-entrypoint.sh脚本
ENTRYPOINT ["docker-entrypoint.sh"] 

# 容器需要开放Shadowsocks的443端口
EXPOSE 443

# 当执行docker run shadowsocks就可以启动image
CMD ["ssserver", "-c", "/etc/shadowsocks/shadowsocks.json"]
