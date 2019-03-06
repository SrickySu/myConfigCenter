#!/bin/bash
showApplication(){
  ps -ef | grep SNAPSHOT | grep -v grep
}

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

  if [ $jarNamePrefix == all ] ; then
    pid=`ps -ef | grep SNAPSHOT | grep -v grep | awk -F ' ' '{print $2}'`
    for i in ${pid[*]}; do
      kill -9 $i
    done
    echo "All applications have been killed."
  else
    pid=`ps -ef | grep java | grep $jarNamePrefix | grep -v grep | awk -F ' ' '{print $2}'`
    if [ "$pid" != "" ] ; then
      kill -9 $pid
      echo "kill $jarNamePrefix."
    else
      echo "Already killed."
    fi
  fi
fi
