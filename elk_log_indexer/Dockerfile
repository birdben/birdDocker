############################################
# version : birdben/elk_log_indexer:v1
# desc : 当前版本安装的elk_log_indexer
############################################
# 设置继承自我们创建的 elasticsearch 镜像
FROM birdben/elasticsearch:v1

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

# 设置环境变量，所有操作都是非交互式的
ENV DEBIAN_FRONTEND noninteractive

# 添加 supervisord 的配置文件，并复制配置文件到对应目录下面。（supervisord.conf文件和Dockerfile文件在同一路径）
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN echo "export LC_ALL=C"

# 设置 ES 的环境变量，若读者有其他的环境变量需要设置，也可以在这里添加。
ENV LOGSTASH_HOME /software/logstash-1.5.4
ENV KIBANA_HOME /software/kibana-4.1.2

# 复制 logstash-1.5.4, kibana-4.1.2 文件到镜像中（logstash-1.5.4, kibana-4.1.2文件夹要和Dockerfile文件在同一路径）
ADD logstash-1.5.4 /software/logstash-1.5.4
ADD kibana-4.1.2 /software/kibana-4.1.2

# 解决环境问题，否则logstash无法从log文件中采集日志。具体环境： Logstash 1.5, Ubuntu 14.04, Oracle JDK7
RUN ln -s /lib/x86_64-linux-gnu/libcrypt.so.1 /usr/lib/x86_64-linux-gnu/libcrypt.so

# 容器需要开放Kibana的5601端口
EXPOSE 5601

# 执行supervisord来同时执行多个命令，使用 supervisord 的可执行路径启动服务。
CMD ["/usr/bin/supervisord"]