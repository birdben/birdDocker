############################################
# version : birdben/jenkins:v1
# desc : 当前版本安装的jenkins
############################################
# 设置继承自我们创建的 jdk8 镜像
FROM birdben/jdk8:v1

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

# 设置环境变量，所有操作都是非交互式的
ENV DEBIAN_FRONTEND noninteractive

ENV JENKINS_HOME /var/jenkins_home
ENV JENKINS_SLAVE_AGENT_PORT 50000

#ENV MAVEN_HOME /var/maven_home
#ENV GIT_HOME /var/git

RUN sudo apt-get install -y vim unzip wget curl

RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
RUN sudo /bin/bash -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
RUN sudo apt-get update
RUN sudo apt-get install jenkins
RUN sudo apt-get install maven
RUN sudo apt-get install git
RUN rm -rf /var/lib/apt/lists/*

VOLUME /var/jenkins_home

# 添加 supervisord 的配置文件，并复制配置文件到对应目录下面。（supervisord.conf文件和Dockerfile文件在同一路径）
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# 容器需要开放Jenkins 8080端口
EXPOSE 8080
EXPOSE 50000

# 执行supervisord来同时执行多个命令，使用 supervisord 的可执行路径启动服务。
CMD ["/usr/bin/supervisord"]
