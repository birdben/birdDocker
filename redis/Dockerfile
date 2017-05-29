############################################
# version : birdben/redis:v2
# desc : 当前版本安装的redis
############################################
# 设置继承自我们创建的 tools 镜像
FROM birdben/tools:v2

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

# 添加User和Group
RUN groupadd -r redis \
    && useradd -r -g redis redis

# 导入Redis的PGP key
RUN set -x \
	&& wget -qO – https://www.dotdeb.org/dotdeb.gpg | apt-key add –

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends apt-transport-https \
	&& rm -rf /var/lib/apt/lists/* \
	&& echo 'deb http://packages.dotdeb.org jessie all' > /etc/apt/sources.list.d/redis.list

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends "redis-server" \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /redis/data \
	&& mkdir -p /redis/config \
	&& mkdir -p /redis/logs \
	&& chown -R redis:redis /redis/data \
	&& chown -R redis:redis /redis/config \
	&& chown -R redis:redis /redis/logs

# 复制docker-entrypoint.sh脚本到/usr/local/bin目录下
COPY docker-entrypoint.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/docker-entrypoint.sh

VOLUME /redis/data
VOLUME /redis/config
VOLUME /redis/logs

# 容器需要开放Redis 6379端口
EXPOSE 6379

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["redis-server", "/redis/config/redis.conf", "--protected-mode", "no"]
