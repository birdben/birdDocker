#! /bin/sh
runFile=bird-task-server-1.0.0.jar
#启动方法
start(){
        exec /usr/local/jdk1.7.0_79/bin/java -Xms128m -Xmx2048m -Duser.timezone=GMT+08 -jar lib/$runFile >> /opt/logs/bird-task-server.log
}
#停止方法
stop(){
        ps -ef|grep $runFile|grep -v "grep"|awk '{print $2}'|while read pid
        do
           kill $pid
           echo "killed "$pid
        done
        sleep 3s
        ps -ef|grep $runFile|grep -v "grep"|awk '{print $2}'|while read pid
        do
           kill -9 $pid
           echo "killed "$pid
        done
}

case "$1" in
start)
  start
  ;;
stop)
  stop
  ;;
restart)
  stop
  start
  ;;
*)
  printf 'Usage: %s {start|stop|restart}\n' "$prog"
  exit 1
  ;;
esac
