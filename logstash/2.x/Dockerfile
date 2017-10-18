############################################
# version : birdben/logstash_2.x:v2
# desc : 当前版本安装的logstash
############################################
# 设置继承自我们创建的 jdk7 镜像
FROM birdben/jdk7:v2

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

# 添加User和Group
RUN groupadd -r logstash \
    && useradd -r -g logstash logstash

# 导入Logstash的PGP key
RUN set -x \
	&& wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends apt-transport-https \
	&& rm -rf /var/lib/apt/lists/* \
	&& echo 'deb https://packages.elastic.co/logstash/2.4/debian stable main' > /etc/apt/sources.list.d/logstash.list

ENV LS_VERSION 1:2.4.1-1

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends "logstash=$LS_VERSION" \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /opt/logstash/logs \
	&& mkdir -p /opt/logstash/logfile \
	&& mkdir -p /opt/logstash/config \
	&& mkdir -p /opt/logstash/patterns \
        && mkdir -p /opt/logstash/data \
	&& chown -R logstash:logstash /opt/logstash/logs \
	&& chown -R logstash:logstash /opt/logstash/logfile \
	&& chown -R logstash:logstash /opt/logstash/config \
	&& chown -R logstash:logstash /opt/logstash/patterns \
        && chown -R logstash:logstash /opt/logstash/data

ENV LS_HOME /opt/logstash
ENV PATH /opt/logstash/bin:$PATH

# 复制docker-entrypoint.sh脚本到/usr/local/bin目录下
COPY docker-entrypoint.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/docker-entrypoint.sh

VOLUME /opt/logstash/logs
VOLUME /opt/logstash/logfile
VOLUME /opt/logstash/config
VOLUME /opt/logstash/patterns
VOLUME /opt/logstash/data

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["logstash", "-f", "/opt/logstash/config/logstash.conf"]
