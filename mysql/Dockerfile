############################################
# version : birdben/ubuntu:mysql
# desc : 当前版本安装的MySQL
############################################
# 设置继承自我们创建的 tools 镜像
FROM birdben/ubuntu:tools

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

# 设置环境变量，所有操作都是非交互式的
ENV DEBIAN_FRONTEND noninteractive

# 添加 supervisord 的配置文件，并复制配置文件到对应目录下面。（supervisord.conf文件和Dockerfile文件在同一路径）
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN echo "export LC_ALL=C"

# 替换ubuntu软件更新的源服务器的sources.list文件
COPY sources.list /etc/apt/sources.list

# 安装升级gcc
RUN sudo rm -rf /var/lib/apt/lists/*
RUN sudo apt-get update
RUN sudo apt-get install -y make cmake gcc g++ bison libncurses5-dev build-essential

# 复制 mysql-5.6.22 文件到镜像中（mysql-5.6.22文件夹要和Dockerfile文件在同一路径）
ADD mysql-5.6.22 /software/downloads/mysql-5.6.22

RUN cd /software/downloads/mysql-5.6.22 && cmake . -DCMAKE_INSTALL_PREFIX=/software/mysql-5.6.22 -DMYSQL_DATADIR=/software/mysql-5.6.22/data -DSYSCONFDIR=/etc -DWITH_INNOBASE_STORAGE_ENGINE=1 -DWITH_ARCHIVE_STORAGE_ENGINE=1 -DWITH_BLACKHOLE_STORAGE_ENGINE=1 -DWITH_PARTITION_STORAGE_ENGINE=1 -DWITH_PERFSCHEMA_STORAGE_ENGINE=1 -DWITHOUT_EXAMPLE_STORAGE_ENGINE=1 -DWITHOUT_FEDERATED_STORAGE_ENGINE=1 -DDEFAULT_CHARSET=utf8 -DDEFAULT_COLLATION=utf8_general_ci -DWITH_EXTRA_CHARSETS=all -DENABLED_LOCAL_INFILE=1 -DWITH_READLINE=1 -DMYSQL_UNIX_ADDR=/software/mysql-5.6.22/mysql.sock -DMYSQL_TCP_PORT=3306 -DMYSQL_USER=mysql -DCOMPILATION_COMMENT="lq-edition" -DENABLE_DTRACE=0 -DOPTIMIZER_TRACE=1 -DWITH_DEBUG=1 && make && make install

# 添加测试用户mysql，密码mysql，并且将此用户添加到sudoers里
RUN useradd mysql
RUN echo "mysql:mysql" | chpasswd
RUN echo "mysql   ALL=(ALL)       ALL" >> /etc/sudoers

# 设置Mysql安装目录的权限
RUN cd /software/mysql-5.6.22 && sudo chown -R mysql:mysql ./

# 复制已经准备好的my.cnf文件到Docker容器
COPY my.cnf /etc/my.cnf
RUN sudo chown mysql:mysql /etc/my.cnf

# 初始化数据库
RUN cd /software/mysql-5.6.22 && sudo ./scripts/mysql_install_db --user=mysql --basedir=/software/mysql-5.6.22 --datadir=/software/mysql-5.6.22/data/

# 设置MySQL的环境变量，若读者有其他的环境变量需要设置，也可以在这里添加。
ENV MYSQL_HOME /software/mysql-5.6.22

# （不推荐下面的路径直接建立在Docker虚拟机上，推荐使用volume挂载方式）
# 在宿主机上创建一个数据库目录存储Mysql的数据文件
# sudo mkdir -p /docker/mysql/data

# VOLUME 选项是将本地的目录挂在到容器中　此处要注意：当你运行-v　＜hostdir>:<Containerdir> 时要确保目录内容相同否则会出现数据丢失
# 对应关系如下
# mysql:/docker/mysql/data
VOLUME ["/software/mysql-5.6.22/data"]

# 容器需要开放MySQL 3306端口
EXPOSE 3306

# 执行supervisord来同时执行多个命令，使用 supervisord 的可执行路径启动服务。
CMD ["/usr/bin/supervisord"]