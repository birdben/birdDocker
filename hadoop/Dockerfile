############################################
# version : birdben/hadoop:v1
# desc : 当前版本安装的hadoop
############################################
# 设置继承自我们创建的 jdk7 镜像
FROM birdben/jdk7:v1

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

# 设置环境变量，所有操作都是非交互式的
ENV DEBIAN_FRONTEND noninteractive

# 添加 supervisord 的配置文件，并复制配置文件到对应目录下面。（supervisord.conf文件和Dockerfile文件在同一路径）
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# 设置 hadoop 的环境变量，若读者有其他的环境变量需要设置，也可以在这里添加。
ENV HADOOP_HOME /software/hadoop-2.7.1
ENV PATH ${HADOOP_HOME}/bin:$PATH

# 复制 hadoop-2.7.1 文件到镜像中（hadoop-2.7.1 文件夹要和Dockerfile文件在同一路径）
ADD hadoop-2.7.1 /software/hadoop-2.7.1

# 创建HDFS存储路径
RUN mkdir -p $HADOOP_HOME/hdfs/name
RUN mkdir -p $HADOOP_HOME/hdfs/data

# 授权HADOOP_HOME路径给admin用户
RUN sudo chown -R admin /software/hadoop-2.7.1

# 容器需要开放Hadoop 9000端口
EXPOSE 9000

# 执行supervisord来同时执行多个命令，使用 supervisord 的可执行路径启动服务。
CMD ["/usr/bin/supervisord"]