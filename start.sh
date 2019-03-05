#!/bin/bash
nohup java -jar /home/mySpringCloud/jar/myEurekaServer-0.0.1-SNAPSHOT.jar > /home/mySpringCloud/log/myEurekaServer.log 2>&1 &
nohup java -jar /home/mySpringCloud/jar/myWeb-0.0.1-SNAPSHOT.jar > /home/mySpringCloud/log/myWeb.log 2>&1 &
