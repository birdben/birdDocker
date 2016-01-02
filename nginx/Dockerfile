############################################
# version : birdben/ubuntu:nginx
# desc : 当前版本安装的nginx
############################################
# 设置继承自我们创建的 tools 镜像
FROM birdben/ubuntu:tools

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

# 设置环境变量，所有操作都是非交互式的
ENV DEBIAN_FRONTEND noninteractive

# 添加 supervisord 的配置文件，并复制配置文件到对应目录下面。（supervisord.conf文件和Dockerfile文件在同一路径）
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# 安装升级gcc
RUN sudo rm -rf /var/lib/apt/lists/*
RUN sudo apt-get update

RUN sudo apt-get -y install \
build-essential

RUN sudo mkdir -p /software/temp
RUN wget http://nginx.org/download/nginx-1.8.0.tar.gz && tar -zxvf nginx-1.8.0.tar.gz -C /software/temp
RUN wget http://zlib.net/zlib-1.2.8.tar.gz && tar -zxvf zlib-1.2.8.tar.gz -C /software/temp
RUN wget http://www.openssl.org/source/openssl-1.0.1q.tar.gz && tar -zxvf openssl-1.0.1q.tar.gz -C /software/temp
RUN wget http://downloads.sourceforge.net/project/pcre/pcre/8.37/pcre-8.37.tar.gz && tar -zxvf pcre-8.37.tar.gz -C /software/temp
RUN cd /software/temp/nginx-1.8.0 && sudo ./configure --sbin-path=/software/nginx-1.8.0/nginx --conf-path=/software/nginx-1.8.0/nginx.conf --pid-path=/software/nginx-1.8.0/nginx.pid --with-http_ssl_module --with-pcre=/software/temp/pcre-8.37 --with-zlib=/software/temp/zlib-1.2.8 --with-openssl=/software/temp/openssl-1.0.1q && sudo make && sudo make install

# 设置nginx是非daemon启动
RUN echo 'daemon off;' >> /software/nginx-1.8.0/nginx.conf
RUN echo 'master_process off;' >> /software/nginx-1.8.0/nginx.conf
RUN echo 'error_log  logs/error.log;' >> /software/nginx-1.8.0/nginx.conf

# 设置 NGINX 的环境变量，若读者有其他的环境变量需要设置，也可以在这里添加。
ENV NGINX_HOME /software/nginx-1.8.0

# 容器需要开放Nginx 80端口
EXPOSE 80

# 执行run.sh文件
# CMD ["/run.sh"]
# 执行supervisord来同时执行多个命令，使用 supervisord 的可执行路径启动服务。
CMD ["/usr/bin/supervisord"]
