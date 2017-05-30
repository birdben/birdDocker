############################################
# version : birdben/rsyslog-kafka:v2
# desc : 当前版本安装的rsyslog-kafka
############################################
# 设置继承自官方 centos 镜像
FROM centos:latest

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

RUN set -x \
	&& yum install -y wget curl

# grab gosu for easy step-down from root
ENV GOSU_VERSION 1.7
RUN set -x \
    && gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-amd64" \
    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-amd64.asc" \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && rm -r /root/.gnupg/ \
    && chmod +x /usr/local/bin/gosu

# 添加User和Group
RUN groupadd -r rsyslog \
    && useradd -r -g rsyslog rsyslog

# 参考官网：http://www.rsyslog.com/rhelcentos-rpms/
COPY rsyslog.repo /etc/yum.repos.d/

RUN set -x \
	&& yum install -y rsyslog rsyslog-kafka.x86_64 \
	&& yum clean all \
	&& mkdir -p /etc/rsyslog.d \
	&& mkdir -p /usr/share/rsyslog/logfile \
	&& mkdir -p /usr/share/rsyslog/pidfile \
	&& mkdir -p /usr/share/rsyslog/statefile \
	&& mkdir -p /usr/share/rsyslog/queue \
	&& chown -R rsyslog:rsyslog /etc/rsyslog.d \
	&& chown -R rsyslog:rsyslog /usr/share/rsyslog/logfile \
	&& chown -R rsyslog:rsyslog /usr/share/rsyslog/pidfile \
	&& chown -R rsyslog:rsyslog /usr/share/rsyslog/statefile \
	&& chown -R rsyslog:rsyslog /usr/share/rsyslog/queue

ENV RSYS_HOME /usr/share/rsyslog

# 复制docker-entrypoint.sh脚本到/usr/local/bin目录下
COPY docker-entrypoint.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/docker-entrypoint.sh

VOLUME /etc/rsyslog.d
VOLUME /usr/share/rsyslog/logfile

EXPOSE 514/tcp 514/udp

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["rsyslogd", "-dn", "-f", "/etc/rsyslog.d/rsyslog2kafka.conf", "-i", "/usr/share/rsyslog/pidfile/rsyslog2kafka.pid"]