#!/usr/bin/env sh
set -e

[ ! -z "$DEBUG" ] && set -ex

rm -rf /app/gogs/docker/s6/gogs || /bin/true
rm -rf /app/gogs/docker/s6/crond || /bin/true

exec /bin/s6-svscan /app/gogs/docker/s6/
