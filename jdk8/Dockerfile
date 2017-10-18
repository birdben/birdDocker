############################################
# version : birdben/jdk8:v2
# desc : 当前版本安装的jdk8
############################################
# 设置继承自我们创建的 tools 镜像
FROM birdben/tools:v2

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

RUN echo 'deb http://deb.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/jessie-backports.list

# 设置 jdk 的环境变量，若读者有其他的环境变量需要设置，也可以在这里添加。
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/jre

# see https://bugs.debian.org/775775
# and https://github.com/docker-library/java/issues/19#issuecomment-70546872
ENV CA_CERTIFICATES_JAVA_VERSION 20160321

RUN set -x \
	&& apt-get update \
	&& apt-get install -y -t jessie-backports \
		openjdk-8-jre-headless \
		openjdk-8-jdk-headless \
        ca-certificates-java \
	&& rm -rf /var/lib/apt/lists/*
