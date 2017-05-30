############################################
# version : birdben/kibana_5.x:v2
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
	&& echo 'deb https://artifacts.elastic.co/packages/5.x/apt stable main' > /etc/apt/sources.list.d/kibana.list

ENV KB_VERSION 5.3.1

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends "kibana=$KB_VERSION" \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /usr/share/kibana/logs \
	&& mkdir -p /usr/share/kibana/config \
	&& chown -R kibana:kibana /usr/share/kibana/logs \
	&& chown -R kibana:kibana /usr/share/kibana/config

ENV KB_HOME /usr/share/kibana
ENV PATH /usr/share/kibana/bin:$PATH

# 复制docker-entrypoint.sh脚本到/usr/local/bin目录下
COPY docker-entrypoint.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/docker-entrypoint.sh

VOLUME /usr/share/kibana/logs
VOLUME /usr/share/kibana/config

# 容器需要开放Kibana的5601端口
EXPOSE 5601

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["kibana"]