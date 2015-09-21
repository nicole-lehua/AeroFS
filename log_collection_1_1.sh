#!/bin/bash

LOG_DIRECTORY=/tmp/aero_appliance_logs
CONTAINERS=`docker ps -a | rev | awk 'NR > 1 {print $1}'| rev`

mkdir $LOG_DIRECTORY

for container in $CONTAINERS;
do
    `docker logs $container  > $LOG_DIRECTORY/$container.log 2>&1`
done

tar -zcvf aerofs-appliance-logs.tar.gz -C $LOG_DIRECTORY .
rm -rf $LOG_DIRECTORY