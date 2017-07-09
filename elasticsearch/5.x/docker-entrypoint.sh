#!/bin/bash
set -e

# first arg is `-f` or `--some-option`
# or first arg is `something.conf`
# echo $@
if [ "${1#-}" != "$1" ]; then
	set -- elasticsearch "$@"
fi

# allow the container to be started with `--user`
# TODO
if [ "$1" = 'elasticsearch' -a "$(id -u)" = '0' ]; then
	chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/data
	chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/logs
	chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/config
	chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/repo
	set -- gosu elasticsearch "$@"
fi

exec "$@"
