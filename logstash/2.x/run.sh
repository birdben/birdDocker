CURRENT_UID=`whoami`
docker run -itd -v /Users/yunyu/workspace_git/birdDocker/logstash/2.x/config:/opt/logstash/config -v /Users/yunyu/workspace_git/birdDocker/logstash/2.x/logs:/opt/logstash/logs --name logstash_2.x_${CURRENT_UID} birdben/logstash_2.x:v2 logstash -f /opt/logstash/config/logstash.conf
