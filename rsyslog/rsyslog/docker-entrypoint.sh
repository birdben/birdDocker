#!/bin/bash
set -e

# first arg is `-f` or `--some-option`
# or first arg is `something.conf`
# echo $@
if [ "${1#-}" != "$1" ]; then
	set -- rsyslogd "$@"
fi

# allow the container to be started with `--user`
# TODO
if [ "$1" = 'rsyslogd' -a "$(id -u)" = '0' ]; then
	chown -R rsyslog:rsyslog /etc/rsyslog.d
	chown -R rsyslog:rsyslog /usr/share/rsyslog/logfile
	chown -R rsyslog:rsyslog /usr/share/rsyslog/pidfile
	set -- gosu rsyslog "$@"
fi

exec "$@"
