## Docker安装zookeeper集群环境

#### 启动Docker容器，这里分别对每个docker容器指定了不同的hostname
```
# 需要暴露2181客户端连接端口号，否则Docker容器外无法连接到zookeeper集群
$ sudo docker run -p 2181:2181 -h zoo1 --name zoo1 -t -i 'birdben/zookeeper_cluster:v1'
$ sudo docker run -h zoo2 --name zoo2 -t -i 'birdben/zookeeper_cluster:v1'
$ sudo docker run -h zoo3 --name zoo3 -t -i 'birdben/zookeeper_cluster:v1'
```

#### 查询Docker容器对应的IP地址
```
$ sudo docker inspect --format='{{.NetworkSettings.IPAddress}}' ${CONTAINER_ID}
```

#### 需要exec进入Docker容器配置myid和hosts文件
```
$ sudo docker exec -it ${CONTAINER_ID} /bin/bash
```

#### 配置每个Docker容器的myid，对应zoo序号执行
```
$ echo 1 > /var/zookeeper/myid
$ echo 2 > /var/zookeeper/myid
$ echo 3 > /var/zookeeper/myid
```

#### 配置每个Docker容器的/etc/hosts文件
```
172.17.0.51     zoo1
172.17.0.52     zoo2
172.17.0.53     zoo3
```

#### 分别启动每个Docker容器中的zookeeper服务
```
$ ./{ZOOKEEPER_HOME}/bin/zkServer.sh start
```

#### 查看每个Docker容器的zookeeper运行状态，会出现类似如下的结果就说明zookeeper集群环境运行正常
```
$ ./{ZOOKEEPER_HOME}/bin/zkServer.sh status
```

```
root@zoo1:/software/zookeeper-3.4.8/bin# ./zkServer.sh status
ZooKeeper JMX enabled by default
Using config: /software/zookeeper-3.4.8/bin/../conf/zoo.cfg
Mode: follower

root@zoo2:/software/zookeeper-3.4.8/bin# ./zkServer.sh status
ZooKeeper JMX enabled by default
Using config: /software/zookeeper-3.4.8/bin/../conf/zoo.cfg
Mode: leader

root@zoo3:/software/zookeeper-3.4.8/bin# ./zkServer.sh status
ZooKeeper JMX enabled by default
Using config: /software/zookeeper-3.4.8/bin/../conf/zoo.cfg
Mode: follower
```