############################################
# version : birdben/golang:v1
# desc : 当前版本安装的golang
############################################
# 设置继承自ubuntu官方镜像
FROM ubuntu:14.04

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

# 设置环境变量，所有操作都是非交互式的
ENV DEBIAN_FRONTEND noninteractive
ENV GO_USER=golang
ENV GO_LOG_DIR=/var/log/golang
# 这里的GOPATH路径是挂载的birdTracker项目的目录
ENV GOPATH=/home/golang/birdTracker
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

#ENV GOLANG_VERSION 1.7.4
#ENV GOLANG_DOWNLOAD_URL https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz
#ENV GOLANG_DOWNLOAD_SHA256 47fda42e46b4c3ec93fa5d4d4cc6a748aa3f9411a2a2b7e08e3a6d80d753ec8b

# 替换 sources.list 的配置文件，并复制配置文件到对应目录下面。
# 这里使用的AWS国内的源，也可以替换成其他的源（例如：阿里云的源）
COPY sources.list /etc/apt/sources.list

# 安装基础工具
RUN sudo apt-get clean
RUN sudo rm -rf /var/lib/apt/lists/*
RUN sudo apt-get update
RUN sudo apt-get install -y vim wget curl git

# 使用apt方式安装golang
RUN sudo apt-get -y install golang

# 下载并安装golang
#RUN curl -fsSL "$GOLANG_DOWNLOAD_URL" -o golang.tar.gz \
#	&& echo "$GOLANG_DOWNLOAD_SHA256  golang.tar.gz" | sha256sum -c - \
#	&& tar -C /usr/local -xzf golang.tar.gz \
#	&& rm golang.tar.gz

# 创建用户和创建目录
RUN set -x && useradd $GO_USER && mkdir -p $GO_LOG_DIR $GOPATH && chown $GO_USER:$GO_USER $GO_LOG_DIR $GOPATH

WORKDIR $GOPATH

# VOLUME 选项是将本地的目录挂载到容器中　此处要注意：当你运行-v　＜hostdir>:<Containerdir> 时要确保目录内容相同否则会出现数据丢失
# 对应关系如下
# /Users/yunyu/workspace_git/birdTracker:/home/golang/birdTracker
# 这里挂载的路径是birdTracker项目的目录
VOLUME ["/home/golang/birdTracker"]

# 执行go_docker.sh脚本，该脚本在birdTracker项目根目录下，用于打包编译启动golang项目的
# 注意挂载的go_docker.sh必须有可执行权限，需要执行chmod +x /Users/yunyu/workspace_git/birdTracker/go_docker.sh
CMD ["/home/golang/birdTracker/go_docker.sh"]
