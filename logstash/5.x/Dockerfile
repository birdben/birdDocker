############################################
# version : birdben/logstash_5.x:v2
# desc : 当前版本安装的logstash
############################################
# 设置继承自我们创建的 jdk8 镜像
FROM birdben/jdk8:v2

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
	&& echo 'deb https://artifacts.elastic.co/packages/5.x/apt stable main' > /etc/apt/sources.list.d/logstash.list

ENV LS_VERSION 1:5.3.1-1

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends "logstash=$LS_VERSION" \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /usr/share/logstash/logs \
	&& mkdir -p /usr/share/logstash/logfile \
	&& mkdir -p /usr/share/logstash/config \
	&& mkdir -p /usr/share/logstash/data \
	&& mkdir -p /usr/share/logstash/patterns \
	&& chown -R logstash:logstash /usr/share/logstash/logs \
	&& chown -R logstash:logstash /usr/share/logstash/logfile \
	&& chown -R logstash:logstash /usr/share/logstash/config \
	&& chown -R logstash:logstash /usr/share/logstash/data \
	&& chown -R logstash:logstash /usr/share/logstash/patterns

ENV LS_HOME /usr/share/logstash
ENV PATH /usr/share/logstash/bin:$PATH

# 复制docker-entrypoint.sh脚本到/usr/local/bin目录下
COPY docker-entrypoint.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/docker-entrypoint.sh

VOLUME /usr/share/logstash/logs
VOLUME /usr/share/logstash/logfile
VOLUME /usr/share/logstash/config
VOLUME /usr/share/logstash/data
VOLUME /usr/share/logstash/patterns

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["logstash", "-f", "/usr/share/logstash/config/logstash.conf"]