############################################
# version : birdben/hive:v1
# desc : 当前版本安装的hive
############################################
# 设置继承自我们创建的 hadoop 镜像
FROM birdben/hadoop:v1

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

# 设置环境变量，所有操作都是非交互式的
ENV DEBIAN_FRONTEND noninteractive

# 添加 supervisord 的配置文件，并复制配置文件到对应目录下面。（supervisord.conf文件和Dockerfile文件在同一路径）
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# 复制 hive-1.2.1 文件到镜像中（hive-1.2.1 文件夹要和Dockerfile文件在同一路径），这里直接把上一篇Hadoop环境直接用上了
ADD apache-hive-1.2.1-bin /software/hive-1.2.1

# 复制MySQL的驱动包到镜像中
COPY mysql-connector-java-5.1.38/mysql-connector-java-5.1.38-bin.jar /software/hive-1.2.1/lib/mysql-connector-java-5.1.38-bin.jar

# 授权HIVE_HOME路径给admin用户
RUN sudo chown -R admin /software/hive-1.2.1

# 执行supervisord来同时执行多个命令，使用 supervisord 的可执行路径启动服务。
CMD ["/usr/bin/supervisord"]