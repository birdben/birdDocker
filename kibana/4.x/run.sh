CURRENT_UID=`whoami`
docker run -itd -p 5601:5601 -v /Users/yunyu/workspace_git/birdDocker/kibana/4.x/config:/opt/kibana/config -v /Users/yunyu/workspace_git/birdDocker/kibana/4.x/logs:/opt/kibana/logs --link elasticsearch_2.x_${CURRENT_UID} --name kibana_4.x_${CURRENT_UID} birdben/kibana_4.x:v2
# --link : 设置启动Kibana客户机容器并链接至ES服务器容器，并且修改kibana.yml配置文件中连接ES的host主机名称