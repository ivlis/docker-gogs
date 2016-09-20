#!/usr/bin/env sh
set -e

[ ! -z "$DEBUG" ] && set -ex

apk --update add gettext

export SECRET_KEY=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-16};echo;)

cat /data/gogs/conf/app.ini.tmpl | envsubst > /data/gogs/conf/app.ini

exec /bin/s6-svscan /app/gogs/docker/s6/