### 启动Docker容器
sudo docker run -h zoo1 --name zoo1 -t -i 'birdben/zookeeper_cluster:v1'
sudo docker run -h zoo2 --name zoo2 -t -i 'birdben/zookeeper_cluster:v1'
sudo docker run -h zoo3 --name zoo3 -t -i 'birdben/zookeeper_cluster:v1'

### 查询Docker容器对应的IP地址
sudo docker inspect --format='{{.NetworkSettings.IPAddress}}' ${CONTAINER_ID}

### 需要exec进入Docker容器配置myid和hosts文件
sudo docker exec -it ${CONTAINER_ID} /bin/bash

### 配置每个Docker容器的myid，对应zoo序号执行
echo 1 > /var/zookeeper/myid
echo 2 > /var/zookeeper/myid
echo 3 > /var/zookeeper/myid

### 配置每个Docker容器的/etc/hosts文件
172.17.0.51     zoo1
172.17.0.52     zoo2
172.17.0.53     zoo3