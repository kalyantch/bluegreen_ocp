#!/bin/bash 

current=`oc get route -l type=bluegreen -o  custom-columns=SERVICE:.spec.to.name --no-headers`

if [ ${current} == 'green' ]
then
  newstate='blue'
  oc patch route/bluegreen -p '{"spec":{"to":{"name":"blue"}}}'
elif [ ${current} == 'blue' ]
then
  newstate='green'
  oc patch route/bluegreen -p '{"spec":{"to":{"name":"green"}}}'
fi
echo "CURRENT STATE=${current}"
echo "NEW STATE='${newstate}"

oc label route/bluegreen svc=${newstate} --overwrite=true
sleep 2
