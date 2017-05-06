# 删除Filebeat数据和日志
rm -rf ./volumes/filebeat/data
rm -rf ./volumes/filebeat/logs

# 删除Redis数据和日志
rm -rf ./volumes/redis/data
rm -rf ./volumes/redis/logs

# 删除Logstash日志
rm -rf ./volumes/logstash/logs

# 删除ES数据和日志
rm -rf ./volumes/elasticsearch/data
rm -rf ./volumes/elasticsearch/logs

# 删除Kibana日志
rm -rf ./volumes/kibana/logs