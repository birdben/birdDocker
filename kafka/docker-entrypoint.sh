#!/bin/bash
set -e

# first arg is `-f` or `--some-option`
# or first arg is `something.conf`
# echo $@
if [ "${1#-}" != "$1" ]; then
	set -- kafka-server-start.sh "$@"
fi

# allow the container to be started with `--user`
# TODO
if [ "$1" = 'kafka-server-start.sh' -a "$(id -u)" = '0' ]; then
	chown -R kafka:kafka /usr/local/kafka/data
	chown -R kafka:kafka /usr/local/kafka/config
	chown -R kafka:kafka /usr/local/kafka/logs
	set -- gosu kafka "$@"
fi

exec "$@"
