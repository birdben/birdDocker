############################################
# version : birdben/filebeat_5.x:v2
# desc : 当前版本安装的filebeat_5.x
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
	&& echo 'deb https://artifacts.elastic.co/packages/5.x/apt stable main' > /etc/apt/sources.list.d/beats.list

ENV FB_VERSION 5.3.1

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends "filebeat=$FB_VERSION" \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /usr/share/filebeat/config \
	&& mkdir -p /usr/share/filebeat/data \
	&& mkdir -p /usr/share/filebeat/logs \
	&& mkdir -p /usr/share/filebeat/logfile \
	&& chown -R filebeat:filebeat /usr/share/filebeat/config \
	&& chown -R filebeat:filebeat /usr/share/filebeat/data \
	&& chown -R filebeat:filebeat /usr/share/filebeat/logs \
	&& chown -R filebeat:filebeat /usr/share/filebeat/logfile

ENV FB_HOME /usr/share/filebeat
ENV PATH /usr/share/filebeat/bin:$PATH

# 复制docker-entrypoint.sh脚本到/usr/local/bin目录下
COPY docker-entrypoint.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/docker-entrypoint.sh

VOLUME /usr/share/filebeat/config
VOLUME /usr/share/filebeat/data
VOLUME /usr/share/filebeat/logs
VOLUME /usr/share/filebeat/logfile

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["filebeat", "-c", "/usr/share/filebeat/config/filebeat.yml"]