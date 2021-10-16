#/bin/bash

N=`expr $1`
i=0
while [ $i -ne $N ]
do
    NAME=`expr $i + 1`
    docker stop virtualhere-"$NAME"
    docker rm virtualhere-"$NAME"
    i=$(($i+1))
done
