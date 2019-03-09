#!/bin/bash
jarNamePrefix=$1
if [ "$jarNamePrefix" != "" ] ; then
    command="nohup java -jar /home/mySpringCloud/jar/$jarNamePrefix-0.0.1-SNAPSHOT.jar > /home/mySpringCloud/log/$jarNamePrefix.log 2>&1 &"
    echo "Command is: $command"
    `$command`
fi
