############################################
# version : birdben/zookeeper:v2
# desc : 当前版本安装的zookeeper
############################################
# 设置继承自我们创建的 jdk8 镜像
FROM birdben/jdk8:v2

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

# 添加User和Group
RUN groupadd -r zookeeper \
    && useradd -r -g zookeeper zookeeper

ENV ZK_VERSION 3.4.8

RUN set -x \
    && wget http://apache.fayea.com/zookeeper/zookeeper-$ZK_VERSION/zookeeper-$ZK_VERSION.tar.gz \
    && tar -zxf "zookeeper-$ZK_VERSION.tar.gz" -C /usr/local \
    && mv /usr/local/zookeeper-$ZK_VERSION /usr/local/zookeeper \
	&& mkdir -p /usr/local/zookeeper/data \
	&& mkdir -p /usr/local/zookeeper/conf \
	&& mkdir -p /usr/local/zookeeper/logs \
	&& mkdir -p /usr/local/zookeeper/datalogs \
	&& chown -R zookeeper:zookeeper /usr/local/zookeeper/data \
	&& chown -R zookeeper:zookeeper /usr/local/zookeeper/conf \
	&& chown -R zookeeper:zookeeper /usr/local/zookeeper/logs \
	&& chown -R zookeeper:zookeeper /usr/local/zookeeper/datalogs \
	&& rm -rf "zookeeper-$ZK_VERSION.tar.gz"

ENV ZK_HOME /usr/local/zookeeper
ENV ZOO_LOG_DIR /usr/local/zookeeper/logs
ENV ZOO_LOG4J_PROP INFO,ROLLINGFILE
ENV PATH /usr/local/zookeeper/bin:$PATH

# 复制docker-entrypoint.sh脚本到/usr/local/bin目录下
COPY docker-entrypoint.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/docker-entrypoint.sh

VOLUME /usr/local/zookeeper/data
VOLUME /usr/local/zookeeper/conf
VOLUME /usr/local/zookeeper/logs
VOLUME /usr/local/zookeeper/datalogs

# 容器需要开放Zookeeper的2181端口
EXPOSE 2181

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["zkServer.sh", "start-foreground"]