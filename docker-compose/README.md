### 下载Zookeeper官方的Docker镜像

```
$ docker pull zookeeper:latest
```

#### 启动Docker-Compose

```
# 启动Docker-Compose后，会自动创建Docker容器并且启动
$ docker-compose up

# 查看当前正在运行的Docker容器
$ docker-compose ps
Name              Command               State                                   Ports
----------------------------------------------------------------------------------------------------------------------
zk1    /docker-entrypoint.sh zkSe ...   Up      0.0.0.0:2181->2181/tcp, 0.0.0.0:2881->2888/tcp, 0.0.0.0:3881->3888/tcp
zk2    /docker-entrypoint.sh zkSe ...   Up      0.0.0.0:2182->2181/tcp, 0.0.0.0:2882->2888/tcp, 0.0.0.0:3882->3888/tcp
zk3    /docker-entrypoint.sh zkSe ...   Up      0.0.0.0:2183->2181/tcp, 0.0.0.0:2883->2888/tcp, 0.0.0.0:3883->3888/tcp
```
