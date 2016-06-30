############################################
# version : birdben/hbase:v1
# desc : 当前版本安装的hbase
############################################
# 设置继承自我们创建的 jdk7 镜像
FROM birdben/jdk7:v1

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

# 设置环境变量，所有操作都是非交互式的
ENV DEBIAN_FRONTEND noninteractive

# 添加 supervisord 的配置文件，并复制配置文件到对应目录下面。（supervisord.conf文件和Dockerfile文件在同一路径）
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# 设置 hbase 的环境变量，若读者有其他的环境变量需要设置，也可以在这里添加。
ENV HBASE_HOME /software/hbase-0.98.19
ENV PATH ${HBASE_HOME}/bin:$PATH

# 复制 hbase-0.98.19 文件到镜像中（hbase-0.98.19 文件夹要和Dockerfile文件在同一路径），这里直接把上一篇Hadoop环境直接用上了
ADD hbase-0.98.19 /software/hbase-0.98.19

# 授权HBASE_HOME路径给admin用户
RUN sudo chown -R admin /software/hbase-0.98.19

# 容器需要开放HBase 60010端口
EXPOSE 60010

# 执行supervisord来同时执行多个命令，使用 supervisord 的可执行路径启动服务。
CMD ["/usr/bin/supervisord"]