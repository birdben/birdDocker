#!/bin/bash
set -e

# first arg is `-f` or `--some-option`
# or first arg is `something.conf`
# echo $@
if [ "${1#-}" != "$1" ]; then
	set -- logstash "$@"
fi

# allow the container to be started with `--user`
# TODO
if [ "$1" = 'logstash' -a "$(id -u)" = '0' ]; then
	set -- gosu logstash "$@"
fi

exec "$@"
