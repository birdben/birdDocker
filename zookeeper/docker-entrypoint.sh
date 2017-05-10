#!/bin/bash
set -e

# first arg is `-f` or `--some-option`
# or first arg is `something.conf`
# echo $@
if [ "${1#-}" != "$1" ]; then
	set -- zkServer.sh "$@"
fi

# allow the container to be started with `--user`
# TODO
if [ "$1" = 'zkServer.sh' -a "$(id -u)" = '0' ]; then
	chown -R zookeeper:zookeeper /usr/local/zookeeper/data
	chown -R zookeeper:zookeeper /usr/local/zookeeper/conf
	chown -R zookeeper:zookeeper /usr/local/zookeeper/logs
	chown -R zookeeper:zookeeper /usr/local/zookeeper/datalogs
	set -- gosu zookeeper "$@"
fi

exec "$@"
