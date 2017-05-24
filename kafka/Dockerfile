############################################
# version : birdben/kafka:v2
# desc : 当前版本安装的kafka
############################################
# 设置继承自我们创建的 jdk8 镜像
FROM birdben/jdk8:v2

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

# 添加User和Group
RUN groupadd -r kafka \
    && useradd -r -g kafka kafka

ENV SCALA_VERSION 2.11
ENV KAFKA_VERSION 0.10.2.0

RUN set -x \
    && wget http://apache.fayea.com/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz \
    && tar -zxf "kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz" -C /usr/local \
    && mv /usr/local/kafka_$SCALA_VERSION-$KAFKA_VERSION /usr/local/kafka \
	&& mkdir -p /usr/local/kafka/data \
	&& mkdir -p /usr/local/kafka/config \
	&& mkdir -p /usr/local/kafka/logs \
	&& chown -R kafka:kafka /usr/local/kafka/data \
	&& chown -R kafka:kafka /usr/local/kafka/config \
	&& chown -R kafka:kafka /usr/local/kafka/logs \
	&& rm -rf "kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz"

ENV KAFKA_HOME /usr/local/kafka
ENV LOG_DIR /usr/local/kafka/logs
ENV PATH /usr/local/kafka/bin:$PATH

# 复制docker-entrypoint.sh脚本到/usr/local/bin目录下
COPY docker-entrypoint.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/docker-entrypoint.sh

VOLUME /usr/local/kafka/data
VOLUME /usr/local/kafka/config
VOLUME /usr/local/kafka/logs

# 容器需要开放Kafka的9092端口
EXPOSE 9092

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["kafka-server-start.sh", "/usr/local/kafka/config/server.properties"]