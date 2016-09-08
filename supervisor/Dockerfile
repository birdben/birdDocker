############################################
# version : birdben/supervisor:v1
# desc : 当前版本安装的supervisor
############################################
# 设置继承自ubuntu官方镜像
FROM ubuntu:14.04

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

# 设置环境变量，所有操作都是非交互式的
ENV DEBIAN_FRONTEND noninteractive

# 添加 supervisord 的配置文件，并复制配置文件到对应目录下面。（supervisord.conf文件和Dockerfile文件在同一路径）
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# 复制 supervisor-3.3.0.tar.gz, setuptools-0.6c11.tar.gz 文件到镜像中（supervisor-3.3.0.tar.gz, setuptools-0.6c11.tar.gz文件要和Dockerfile文件在同一路径）
COPY supervisor-3.3.0.tar.gz /data/
COPY setuptools-0.6c11.tar.gz /data/

# 复制项目
COPY bird-authority.tar.gz /data/
COPY bird-task-server.tar.gz /data/
COPY bird-log-server.tar.gz /data/

# 解压并且安装setuptools, supervisor
RUN cd /data/ && tar zxf setuptools-0.6c11.tar.gz && cd setuptools-0.6c11/ && python setup.py build && python setup.py install && rm -f setuptools-0.6c11.tar.gz
RUN cd /data/ && tar zxf supervisor-3.3.0.tar.gz && cd supervisor-3.3.0/ && python setup.py install && rm -f supervisor-3.3.0.tar.gz
RUN cd /data/ && tar zxf bird-authority.tar.gz && rm -f /data/bird-authority.tar.gz
RUN cd /data/ && tar zxf bird-task-server.tar.gz && rm -f /data/bird-task-server.tar.gz
RUN cd /data/ && tar zxf bird-log-server.tar.gz && rm -f /data/bird-log-server.tar.gz

# 执行supervisord来同时执行多个命令，使用 supervisord 的可执行路径启动服务。
CMD ["/usr/bin/supervisord"]
