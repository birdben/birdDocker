############################################
# version : birdben/jenkins:v1
# desc : 当前版本安装的jenkins
############################################
# 设置继承自我们创建的 jdk8 镜像
FROM jenkins

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

# 设置环境变量，所有操作都是非交互式的
ENV DEBIAN_FRONTEND noninteractive

ENV MAVEN_HOME /opt/apache-maven-3.3.9
ENV PATH $PATH:/opt/apache-maven-3.3.9/bin

USER root

RUN chown -R jenkins:jenkins /opt

USER jenkins

COPY ./file/apache-maven-3.3.9-bin.tar /opt
RUN cd /opt && tar xvf apache-maven-3.3.9-bin.tar && rm -f apache-maven-3.3.9-bin.tar
COPY ./file/settings.xml $MAVEN_HOME/conf
