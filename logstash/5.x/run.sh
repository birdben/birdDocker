CURRENT_UID=`whoami`
docker run -itd -v /Users/yunyu/workspace_git/birdDocker/logstash/5.x/config:/usr/share/logstash/config -v /Users/yunyu/workspace_git/birdDocker/logstash/5.x/logs:/usr/share/logstash/logs --name logstash_5.x_${CURRENT_UID} birdben/logstash_5.x:v2 logstash -f /usr/share/logstash/config/logstash.conf
