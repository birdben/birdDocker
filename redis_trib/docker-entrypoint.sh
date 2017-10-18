#!/bin/bash
set -e

# first arg is `-f` or `--some-option`
# or first arg is `something.conf`
# echo $@
if [ "${1#-}" != "$1" ]; then
	set -- redis-trib.rb "$@"
fi

# allow the container to be started with `--user`
# TODO
if [ "$1" = 'redis-trib.rb' -a "$(id -u)" = '0' ]; then
	chown -R redis:redis /redis/data
	chown -R redis:redis /redis/config
	chown -R redis:redis /redis/logs
	set -- gosu redis "$@"
fi

exec "$@"
