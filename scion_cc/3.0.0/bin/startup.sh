#!/bin/bash

echo "=== STARTUP CONTAINER ==="
source ~/.bash_profile

XPG_HOST=${POSTGRES_PORT_5432_TCP_ADDR:-localhost}
XPG_PORT=${POSTGRES_PORT_5432_TCP_PORT:-5432}
POSTGRES_ENV_POSTGRES_PASSWORD


sed "s/%SYSNAME%/${SYSNAME:-scion}/g;s/%AMQP_HOST%/${AMQP_HOST}/g;s/%AMQP_PORT%/${AMQP_PORT:-5672}/g;\
s/%AMQP_USER%/${AMQP_USER:-guest}/g;s/%AMQP_PASSWORD%/${AMQP_PASSWORD:-guest}/g;s/%PG_HOST%/${PG_HOST:-$XPG_HOST}/g;\
s/%PG_PORT%/${PG_PORT:-$XPG_PORT}/g;s/%PG_USER%/${PG_USER:-ion}/g;s/%PG_PASSWORD%/${PG_PASSWORD}/g;\
s/%PG_ADMIN_USER%/${PG_ADMIN_USER}/g;s/%PG_ADMIN_PASSWORD%/${PG_ADMIN_PASSWORD}/g;\
s/%AMQP_MPORT%/${AMQP_MPORT:-15672}/g;s/%AMQP_MUSER%/${AMQP_MUSER:-guest}/g;s/%AMQP_MPASSWORD%/${AMQP_MPASSWORD:-guest}/g" \
res/pyon.local.yml.template > res/pyon.local.yml

cp res/pyon.local.yml code/scioncc/defs/res/config
