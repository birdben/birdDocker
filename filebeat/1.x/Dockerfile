############################################
# version : birdben/filebeat_1.x:v2
# desc : 当前版本安装的filebeat_1.x
############################################
# 设置继承自我们创建的 tools 镜像
FROM birdben/tools:v2

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

# 添加User和Group
RUN groupadd -r filebeat \
    && useradd -r -g filebeat filebeat

# 导入Elasticsearch的PGP key
RUN set -x \
	&& wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends apt-transport-https \
	&& rm -rf /var/lib/apt/lists/* \
	&& echo 'deb https://packages.elastic.co/beats/apt stable main' > /etc/apt/sources.list.d/beats.list

ENV FB_VERSION 1.3.1

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends "filebeat=$FB_VERSION" \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /opt/filebeat/config \
	&& mkdir -p /opt/filebeat/data \
	&& mkdir -p /opt/filebeat/logs \
	&& mkdir -p /opt/filebeat/logfile \
	&& chown -R filebeat:filebeat /opt/filebeat/config \
	&& chown -R filebeat:filebeat /opt/filebeat/data \
	&& chown -R filebeat:filebeat /opt/filebeat/logs \
	&& chown -R filebeat:filebeat /opt/filebeat/logfile

ENV FB_HOME /opt/filebeat

# 复制docker-entrypoint.sh脚本到/usr/local/bin目录下
COPY docker-entrypoint.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/docker-entrypoint.sh

VOLUME /opt/filebeat/config
VOLUME /opt/filebeat/data
VOLUME /opt/filebeat/logs
VOLUME /opt/filebeat/logfile

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["filebeat", "-c", "/opt/filebeat/config/filebeat.yml"]