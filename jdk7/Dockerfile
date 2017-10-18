############################################
# version : birdben/jdk7:v2
# desc : 当前版本安装的jdk7
############################################
# 设置继承自我们创建的 tools 镜像
FROM birdben/tools:v2

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

# 设置 jdk 的环境变量，若读者有其他的环境变量需要设置，也可以在这里添加。
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64/jre

RUN set -x \
	&& apt-get update \
	&& apt-get install -y \
		openjdk-7-jdk \
		ca-certificates-java \
	&& rm -rf /var/lib/apt/lists/*
