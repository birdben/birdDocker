#!/bin/bash
set -e

# first arg is `-f` or `--some-option`
# or first arg is `something.conf`
# echo $@
if [ "${1#-}" != "$1" ]; then
	set -- nginx "$@"
fi

# allow the container to be started with `--user`
# TODO
#if [ "$1" = 'nginx' -a "$(id -u)" = '0' ]; then
#	chown -R nginx .
#	exec gosu nginx "$0" "$@"
#fi

exec "$@"
