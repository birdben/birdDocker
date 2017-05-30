############################################
# version : birdben/nginx:v2
# desc : 当前版本安装的nginx
############################################
# 设置继承自我们创建的 tools 镜像
FROM birdben/tools:v2

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

# 添加User和Group
RUN groupadd -r nginx \
    && useradd -r -g nginx nginx

# 设置 NGINX 的环境变量，若读者有其他的环境变量需要设置，也可以在这里添加。
ENV NGINX_HOME /software/nginx-1.8.0

# 安装升级gcc
RUN apt-get update \
    && apt-get -y install build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /software/temp \
    && wget http://nginx.org/download/nginx-1.8.0.tar.gz \
    && tar -zxvf nginx-1.8.0.tar.gz -C /software/temp \
    && wget http://zlib.net/zlib-1.2.11.tar.gz \
    && tar -zxvf zlib-1.2.11.tar.gz -C /software/temp \
    && wget http://www.openssl.org/source/openssl-1.0.1q.tar.gz \
    && tar -zxvf openssl-1.0.1q.tar.gz -C /software/temp \
    && wget http://downloads.sourceforge.net/project/pcre/pcre/8.37/pcre-8.37.tar.gz \
    && tar -zxvf pcre-8.37.tar.gz -C /software/temp \
    && cd /software/temp/nginx-1.8.0 \
    && ./configure --sbin-path=/software/nginx-1.8.0/nginx --conf-path=/software/nginx-1.8.0/nginx.conf --pid-path=/software/nginx-1.8.0/nginx.pid --with-http_ssl_module --with-pcre=/software/temp/pcre-8.37 --with-zlib=/software/temp/zlib-1.2.11 --with-openssl=/software/temp/openssl-1.0.1q \
    && make \
    && make install

# 设置nginx是非daemon启动
RUN echo 'daemon off;' >> /software/nginx-1.8.0/nginx.conf
RUN echo 'master_process off;' >> /software/nginx-1.8.0/nginx.conf
RUN echo 'error_log  logs/error.log;' >> /software/nginx-1.8.0/nginx.conf

# 复制docker-entrypoint.sh脚本到/usr/local/bin目录下
COPY docker-entrypoint.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/docker-entrypoint.sh
RUN ln -s /software/nginx-1.8.0/nginx /usr/local/bin/nginx

# 当执行docker run shadowsocks就会执行docker-entrypoint.sh脚本
ENTRYPOINT ["docker-entrypoint.sh"]

# 容器需要开放Nginx 80端口
EXPOSE 80 443

# 执行run.sh文件
CMD ["nginx"]
