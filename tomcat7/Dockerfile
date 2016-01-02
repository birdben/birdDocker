############################################
# version : birdben/ubuntu:tomcat7
# desc : 当前版本安装的tomcat7
############################################
# 设置继承自我们创建的 jdk7 镜像
FROM birdben/ubuntu:jdk7

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

# 设置环境变量，所有操作都是非交互式的
ENV DEBIAN_FRONTEND noninteractive

# 添加 supervisord 的配置文件，并复制配置文件到对应目录下面。（supervisord.conf文件和Dockerfile文件在同一路径）
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# 设置 tomcat 的环境变量，若读者有其他的环境变量需要设置，也可以在这里添加。
ENV CATALINA_HOME /software/tomcat7

# 复制 apache-tomcat-7.0.55 文件到镜像中（apache-tomcat-7.0.55 文件夹要和Dockerfile文件在同一路径）
ADD apache-tomcat-7.0.55 /software/tomcat7

# 容器需要开放Tomcat 8080端口
EXPOSE 8080

# 执行supervisord来同时执行多个命令，使用 supervisord 的可执行路径启动服务。
CMD ["/usr/bin/supervisord"]
