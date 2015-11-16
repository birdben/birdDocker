############################################
# version : birdben/ubuntu:tomcat7
# desc : 当前版本安装的supervisor，jdk7，tomcat7
############################################
# 设置继承自我们创建的 tools 镜像
FROM birdben/ubuntu:tools

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

# 设置环境变量，所有操作都是非交互式的
ENV DEBIAN_FRONTEND noninteractive

# 安装supervisor工具
RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
# 添加 supervisord 的配置文件，并复制配置文件到对应目录下面。（supervisord.conf文件和Dockerfile文件在同一路径）
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# 设置 tomcat 的环境变量，若读者有其他的环境变量需要设置，也可以在这里添加。
ENV CATALINA_HOME /usr/tomcat7
ENV JAVA_HOME /usr/jdk7

# 复制 apache-tomcat-7.0.55 和 jdk1.7.0_71 文件到镜像中（apache-tomcat-7.0.55 与 jdk1.7.0_71 文件夹要和Dockerfile文件在同一路径）
ADD apache-tomcat-7.0.55 /usr/tomcat7
ADD jdk1.7.0_71 /usr/jdk7

# 如果使用执行run.sh脚本的方式，需要把run.sh脚本文件添加到容器中（run.sh文件和Dockerfile文件在同一路径）
# ADD run.sh /run.sh
RUN chmod +x /usr/tomcat7/bin/*.sh

# 容器需要开放Tomcat 8080端口
EXPOSE 8080

# 执行run.sh文件
# CMD ["/run.sh"]
# 执行supervisord来同时执行多个命令，使用 supervisord 的可执行路径启动服务。
CMD ["/usr/bin/supervisord"]
