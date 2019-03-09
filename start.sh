#!/bin/bash
jarNamePrefix=$1
jarNameArray=(all myEurekaServer myWeb myService1)
if [ "$jarNamePrefix" == "" ] ; then
  echo "Please input a parameter."
else
  existFlag=false
  for i in ${jarNameArray[*]}; do
    if [ $i == $jarNamePrefix ] ; then
      existFlag=true
      break
    fi
  done
  
  if [ $existFlag == false ] ; then
    echo "The parameter doesn't exist. Available parameters are:"
    echo ${jarNameArray[*]}
    exit 1
  fi

  seconds=20
  if [ $jarNamePrefix == all ] ; then
    /home/mySpringCloud/config/stop.sh all
    for i in ${jarNameArray[*]}; do
      if [ $i != all ] ; then
        /home/mySpringCloud/config/start_one.sh $i &
        echo "waiting for $seconds seconds."
        sleep ${seconds}s
      fi
    done
    echo "All applications are running."
  else
    /home/mySpringCloud/config/stop.sh $jarNamePrefix
    /home/mySpringCloud/config/start_one.sh $jarNamePrefix &
    sleep ${seconds}s
    echo "$jarNamePrefix is running."
  fi
fi
