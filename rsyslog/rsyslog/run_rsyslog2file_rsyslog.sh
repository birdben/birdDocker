docker run -itd --user rsyslog -v /Users/yunyu/workspace_git/birdDocker/rsyslog/rsyslog/logfile:/usr/share/rsyslog/logfile -v /Users/yunyu/workspace_git/birdDocker/rsyslog/rsyslog/config:/etc/rsyslog.d --name rsyslog2file_rsyslog birdben/rsyslog:v2 rsyslogd -d -n -f /etc/rsyslog.d/rsyslog2file.conf -i /usr/share/rsyslog/pidfile/rsyslog2file.pid
# -d:开启rsyslog的DEBUG模式启动
# -n:rsyslog前台启动