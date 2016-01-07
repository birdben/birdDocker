############################################
# version : birdben/mongodb:v1
# desc : 当前版本安装的mongodb
############################################
# 设置继承自我们创建的 tools 镜像
FROM birdben/tools:v1

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

# 设置环境变量，所有操作都是非交互式的
ENV DEBIAN_FRONTEND noninteractive

# 添加 supervisord 的配置文件，并复制配置文件到对应目录下面。（supervisord.conf文件和Dockerfile文件在同一路径）
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# 设置 mongo 的环境变量，若读者有其他的环境变量需要设置，也可以在这里添加。
ENV MONGO_HOME /software/mongodb-3.0.7
ENV LC_ALL C

# 复制 mongodb-3.0.7 文件到镜像中（mongodb-3.0.7 文件夹要和Dockerfile文件在同一路径）
ADD mongodb-3.0.7 /software/mongodb-3.0.7

# VOLUME 选项是将本地的目录挂在到容器中　此处要注意：当你运行-v　＜hostdir>:<Containerdir> 时要确保目录内容相同否则会出现数据丢失
# 对应关系如下
# mongo:/docker/mongodb
VOLUME ["/mongodb"]

# 容器需要开放Mongo 30000端口
EXPOSE 30000

# 执行supervisord来同时执行多个命令，使用 supervisord 的可执行路径启动服务。
CMD ["/usr/bin/supervisord"]
