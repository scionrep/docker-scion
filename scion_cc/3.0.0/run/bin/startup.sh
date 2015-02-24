#!/bin/bash

echo "=== STARTUP CONTAINER ==="
source ~/.bash_profile

# Make a pyon.local.yml config file with defaults from ENV

sed "s/%SYSNAME%/${SYSNAME:-scion}/g;\
s/%AMQP_HOST%/${AMQP_HOST:-$RABBITMQ_PORT_5672_TCP_ADDR}/g;\
s/%AMQP_PORT%/${AMQP_PORT:-${RABBITMQ_PORT_5672_TCP_PORT:-5672}}/g;\
s/%AMQP_USER%/${AMQP_USER:-guest}/g;\
s/%AMQP_PASSWORD%/${AMQP_PASSWORD:-guest}/g;\
s/%PG_HOST%/${PG_HOST:-${POSTGRES_PORT_5432_TCP_ADDR:-localhost}}/g;\
s/%PG_PORT%/${PG_PORT:-${POSTGRES_PORT_5432_TCP_PORT:-5432}}/g;\
s/%PG_USER%/${PG_USER:-ion}/g;\
s/%PG_PASSWORD%/${PG_PASSWORD:-$POSTGRES_ION_PASSWORD}/g;\
s/%PG_ADMIN_USER%/${PG_ADMIN_USER:-postgres}/g;\
s/%PG_ADMIN_PASSWORD%/${PG_ADMIN_PASSWORD:-$POSTGRES_PASSWORD}/g;\
s/%AMQP_MPORT%/${AMQP_MPORT:-${RABBITMQ_PORT_15672_TCP_PORT:-15672}}/g;\
s/%AMQP_MUSER%/${AMQP_MUSER:-guest}/g;\
s/%AMQP_MPASSWORD%/${AMQP_MPASSWORD:-guest}/g" \
res/pyon.local.yml.template > res/pyon.local.yml

cp res/pyon.local.yml code/scioncc/defs/res/config

# Start the container

if [ -z "$NO_PYCC" ] ; then
    cd $SCION_DIR
    echo "bin/pycc ${PYCC_ARGS:--n}"
    eval "bin/pycc ${PYCC_ARGS:--n}"
fi
