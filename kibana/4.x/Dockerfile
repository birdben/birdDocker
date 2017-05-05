############################################
# version : birdben/kibana_4.x:v2
# desc : 当前版本安装的kibana
############################################
# 设置继承自我们创建的 tools 镜像
FROM birdben/tools:v2

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

# 添加User和Group
RUN groupadd -r kibana \
    && useradd -r -g kibana kibana

# 导入Elasticsearch的PGP key
RUN set -x \
	&& wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends apt-transport-https \
	&& rm -rf /var/lib/apt/lists/* \
	&& echo 'deb https://packages.elastic.co/kibana/4.6/debian stable main' > /etc/apt/sources.list.d/kibana.list

ENV KB_VERSION 4.6.4

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends "kibana=$KB_VERSION" \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /opt/kibana/logs \
	&& mkdir -p /opt/kibana/config \
	&& chown -R kibana:kibana /opt/kibana/logs \
	&& chown -R kibana:kibana /opt/kibana/config

ENV KB_HOME /opt/kibana
ENV PATH /opt/kibana/bin:$PATH

# 复制docker-entrypoint.sh脚本到/usr/local/bin目录下
COPY docker-entrypoint.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/docker-entrypoint.sh

VOLUME /opt/kibana/logs
VOLUME /opt/kibana/config

# 容器需要开放Kibana的5601端口
EXPOSE 5601

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["kibana"]