############################################
# version : birdben/sentinel:v2
# desc : 当前版本安装的redis_sentinel
############################################
# 设置继承自官方的 redis 镜像
FROM redis:3

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

RUN set -x \
	&& mkdir -p /sentinel/data \
	&& mkdir -p /sentinel/config \
	&& mkdir -p /sentinel/logs \
	&& chown -R redis:redis /sentinel/data \
	&& chown -R redis:redis /sentinel/config \
	&& chown -R redis:redis /sentinel/logs

# 复制docker-entrypoint.sh脚本到/usr/local/bin目录下
COPY docker-entrypoint.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/docker-entrypoint.sh

VOLUME /sentinel/data
VOLUME /sentinel/config
VOLUME /sentinel/logs

# 容器需要开放sentinel 26379端口
EXPOSE 26379

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["redis-sentinel", "/sentinel/config/sentinel.conf"]
