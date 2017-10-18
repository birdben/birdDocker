############################################
# version : birdben/redis_trib:v2
# desc : 当前版本安装的redis_trib
############################################
# 设置继承自我们创建的 tools 镜像
FROM birdben/redis:v2

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

RUN set -x \
	&& curl -sSL https://get.rvm.io | bash -s stable

ENV PATH /usr/local/rvm/bin:$PATH

RUN set -x \
	&& rvm install ruby-2.3.1 \
	&& apt-get update \
	&& apt-get install -y gem \
	&& apt-get install -y rubygems \
	&& gem install redis \
	&& rm -rf /var/lib/apt/lists/*

# 复制redis-trib.rb脚本到/usr/bin目录下
COPY redis-trib.rb /usr/bin
