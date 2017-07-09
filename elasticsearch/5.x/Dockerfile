############################################
# version : birdben/elasticsearch_5.x:v2
# desc : 当前版本安装的elasticsearch_5.x
############################################
# 设置继承自我们创建的 jdk8 镜像
FROM birdben/jdk8:v2

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

# 添加User和Group
RUN groupadd -r elasticsearch \
    && useradd -r -g elasticsearch elasticsearch

# 导入Elasticsearch的PGP key
RUN set -x \
	&& wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends apt-transport-https \
	&& rm -rf /var/lib/apt/lists/* \
	&& echo 'deb https://artifacts.elastic.co/packages/5.x/apt stable main' > /etc/apt/sources.list.d/elasticsearch.list

ENV ES_VERSION 5.3.1
ENV ES_SKIP_SET_KERNEL_PARAMETERS true

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends "elasticsearch=$ES_VERSION" \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /usr/share/elasticsearch/data \
	&& mkdir -p /usr/share/elasticsearch/logs \
	&& mkdir -p /usr/share/elasticsearch/config \
	&& mkdir -p /usr/share/elasticsearch/repo \
	&& chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/data \
	&& chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/logs \
	&& chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/config \
	&& chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/repo

ENV ES_HOME /usr/share/elasticsearch
ENV PATH /usr/share/elasticsearch/bin:$PATH

# 复制docker-entrypoint.sh脚本到/usr/local/bin目录下
COPY docker-entrypoint.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/docker-entrypoint.sh

VOLUME /usr/share/elasticsearch/data
VOLUME /usr/share/elasticsearch/logs
VOLUME /usr/share/elasticsearch/config
VOLUME /usr/share/elasticsearch/repo

# 容器需要开放ES的9200和9300端口
EXPOSE 9200 9300

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["elasticsearch"]