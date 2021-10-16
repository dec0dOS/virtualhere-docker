#!/bin/bash

FIRST_PORT=7575
N=`expr $1`
i=0
while [ $i -ne $N ]
do
    PORT=`expr $FIRST_PORT + $i`
    NAME=`expr $i + 1`
    docker run -d -p "$PORT":7575 --privileged --name virtualhere-"$NAME" --restart unless-stopped virtualhere
    docker logs virtualhere-"$NAME"
    i=$(($i+1))
done
