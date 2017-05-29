############################################
# version : birdben/rsyslog:v2
# desc : 当前版本安装的rsyslog
############################################
# 设置继承自我们创建的 tools 镜像
FROM birdben/tools:v2

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

# 添加User和Group
RUN groupadd -r rsyslog \
    && useradd -r -g rsyslog rsyslog

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends apt-transport-https \
	&& rm -rf /var/lib/apt/lists/*

ENV RSYS_VERSION 8.4.2-1+deb8u2

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends "rsyslog=$RSYS_VERSION" \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /etc/rsyslog.d \
	&& mkdir -p /usr/share/rsyslog/logfile \
	&& mkdir -p /usr/share/rsyslog/pidfile \
	&& chown -R rsyslog:rsyslog /etc/rsyslog.d \
	&& chown -R rsyslog:rsyslog /usr/share/rsyslog/logfile \
	&& chown -R rsyslog:rsyslog /usr/share/rsyslog/pidfile

ENV RSYS_HOME /usr/share/rsyslog

# 复制docker-entrypoint.sh脚本到/usr/local/bin目录下
COPY docker-entrypoint.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/docker-entrypoint.sh

VOLUME /etc/rsyslog.d
VOLUME /usr/share/rsyslog/logfile

EXPOSE 514/tcp 514/udp

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["rsyslogd", "-dn", "-f", "/etc/rsyslog.d/rsyslog2file.conf", "-i", "/usr/share/rsyslog/pidfile/rsyslog2file.pid"]