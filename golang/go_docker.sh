#!/bin/bash
MAIN_PATH=`pwd`/src/main/
LOG_PATH=`pwd`/logs

cd $MAIN_PATH
# 下载第三方引用包
go get github.com/golang/glog
go install

echo "日志目录："$LOG_PATH
if [ ! -d "$LOG_PATH" ]; then
    mkdir -p "$LOG_PATH"
fi

cd $GOPATH
./bin/main -v 10 -log_dir=$LOG_PATH -stderrthreshold=INFO