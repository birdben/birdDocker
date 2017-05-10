# 删除Zookeeper1数据和日志
rm -rf ./volumes/zoo1/data
rm -rf ./volumes/zoo1/datalogs
rm -rf ./volumes/zoo1/logs

# 删除Zookeeper2数据和日志
rm -rf ./volumes/zoo2/data
rm -rf ./volumes/zoo2/datalogs
rm -rf ./volumes/zoo2/logs

# 删除Zookeeper3数据和日志
rm -rf ./volumes/zoo3/data
rm -rf ./volumes/zoo3/datalogs
rm -rf ./volumes/zoo3/logs

# 重新创建data目录
mkdir -p ./volumes/zoo1/data
mkdir -p ./volumes/zoo2/data
mkdir -p ./volumes/zoo3/data

# 复制myid文件
cp ./volumes/zoo1/conf/myid ./volumes/zoo1/data
cp ./volumes/zoo2/conf/myid ./volumes/zoo2/data
cp ./volumes/zoo3/conf/myid ./volumes/zoo3/data