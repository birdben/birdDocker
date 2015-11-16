############################################
# version : birdben/ubuntu:tools
# desc : 当前版本安装的ssh，wget，curl
############################################
# 设置继承自ubuntu官方镜像
FROM ubuntu:14.04

# 下面是一些创建者的基本信息
MAINTAINER birdben (191654006@163.com)

# 注意这里要更改系统的时区设置，因为在 web 应用中经常会用到时区这个系统变量，默认的 ubuntu 会让你的应用程序发生不可思议的效果哦
RUN echo "Asia/Shanghai" > /etc/timezone && \
        dpkg-reconfigure -f noninteractive tzdata

# 清空ubuntu更新包
RUN sudo rm -rf /var/lib/apt/lists/*

# 更新源，安装ssh server
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe"> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd

# 设置root ssh远程登录密码为root
RUN sudo echo "root:root" | chpasswd

# 一次性安装wget，curl等必备软件
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y wget curl

# 容器需要开放SSH 22端口
EXPOSE 22

# 方式一：直接执行ssh启动命令，这里选择后台运行，日志不会输出到终端
# ENTRYPOINT ["/usr/sbin/sshd"]
# CMD ["-D"]
# 方式二：也可以写一个run.sh的脚本文件来执行命令
# CMD ["/run.sh"]
# 方式三：在执行docker run命令时，执行ssh启动命令（这里使用这种方式）
