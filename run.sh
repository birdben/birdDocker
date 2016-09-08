continerid=`sudo docker images|grep birdben/elasticsearch|grep v1|awk '{print $3}'`
uid=`whoami`
#sudo docker run -itd -p 9999:22 -p 9200:9200 -p 9300:9300 --name elasticsearch-${uid} ${continerid} /bin/bash
sudo docker run -itd -p 9999:22 -p 9200:9200 -p 9300:9300 --name elasticsearch-${uid} ${continerid}