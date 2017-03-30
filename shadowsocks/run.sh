CURRENT_UID=`whoami`
docker run -itd -p 443:443 -v /Users/yunyu/workspace_git/birdDocker/shadowsocks/conf:/etc/shadowsocks -v /Users/yunyu/workspace_git/birdDocker/shadowsocks/logs/shadowsocks:/var/log/shadowsocks -v /Users/yunyu/workspace_git/birdDocker/shadowsocks/logs/supervisor:/var/log/supervisor --name shadowsocks_${CURRENT_UID} birdben/shadowsocks:v1
