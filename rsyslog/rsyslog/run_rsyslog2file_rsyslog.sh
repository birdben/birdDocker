docker run -itd --user rsyslog -v /Users/yunyu/workspace_git/birdDocker/rsyslog/rsyslog/logfile:/usr/share/rsyslog/logfile -v /Users/yunyu/workspace_git/birdDocker/rsyslog/rsyslog/config:/etc/rsyslog.d --name rsyslog2file_rsyslog birdben/rsyslog:v2
# -d:开启rsyslog的DEBUG模式启动
# -n:rsyslog前台启动