docker run -itd --user rsyslog -v /Users/yunyu/workspace_git/birdDocker/rsyslog/rsyslog-kafka/logfile:/usr/share/rsyslog/logfile -v /Users/yunyu/workspace_git/birdDocker/rsyslog/rsyslog-kafka/config:/etc/rsyslog.d --link kafka_kafka:kafka --name rsyslog2kafka_rsyslog birdben/rsyslog-kafka:v2
# -d:开启rsyslog的DEBUG模式启动
# -n:rsyslog前台启动