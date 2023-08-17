#!/bin/bash

REDIS_ADDR=$1
REDIS_PORT=$2

REDIS_ROLE=$(docker exec redis-tp-sp-01 redis-cli -h $REDIS_ADDR -p $REDIS_PORT role | head -n 1)

if [ $REDIS_ROLE == 'slave' ]
then
    docker exec redis-tp-uz-01 redis-cli -h $REDIS_ADDR -p $REDIS_PORT CLUSTER FAILOVER
fi
