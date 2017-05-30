#!/bin/bash
set -e

# first arg is `-f` or `--some-option`
# or first arg is `something.conf`
if [ "${1#-}" != "$1" ]; then
	set -- ssserver "$@"
fi

# allow the container to be started with `--user`
# 不需要使用gosu切换用户运行ssserver，ssserver有--user参数指定执行用户
#if [ "$1" = 'ssserver' -a "$(id -u)" = '0' ]; then
#	# chown -R ssserver .
#	# exec gosu ssserver "$0" "$@"
#fi

exec "$@"
