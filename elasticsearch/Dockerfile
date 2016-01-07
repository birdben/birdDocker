############################################
# version : birdben/elasticsearch:v1
# desc : 当前版本安装的elasticsearch
############################################
# 设置继承自我们创建的 jdk7 镜像
FROM birdben/jdk7:v1

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

# 设置环境变量，所有操作都是非交互式的
ENV DEBIAN_FRONTEND noninteractive

# 添加 supervisord 的配置文件，并复制配置文件到对应目录下面。（supervisord.conf文件和Dockerfile文件在同一路径）
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN echo "export LC_ALL=C"

# 设置 ES 的环境变量，若读者有其他的环境变量需要设置，也可以在这里添加。
ENV ES_HOME /software/elasticsearch-1.7.2

# 复制 elasticsearch-1.7.2 文件到镜像中（elasticsearch-1.7.2文件夹要和Dockerfile文件在同一路径）
ADD elasticsearch-1.7.2 /software/elasticsearch-1.7.2

# 容器需要开放ES的9200和9300端口
EXPOSE 9200
EXPOSE 9300

# 执行supervisord来同时执行多个命令，使用 supervisord 的可执行路径启动服务。
CMD ["/usr/bin/supervisord"]
