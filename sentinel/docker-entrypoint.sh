#!/bin/bash
set -e

# first arg is `-f` or `--some-option`
# or first arg is `something.conf`
# echo $@
if [ "${1#-}" != "$1" ]; then
	set -- redis-sentinel "$@"
fi

# allow the container to be started with `--user`
# TODO
if [ "$1" = 'redis-sentinel' -a "$(id -u)" = '0' ]; then
	chown -R redis:redis /sentinel/data
	chown -R redis:redis /sentinel/config
	chown -R redis:redis /sentinel/logs
	set -- gosu redis "$@"
fi

exec "$@"
