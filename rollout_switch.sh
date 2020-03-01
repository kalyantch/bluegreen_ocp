#!/bin/bash 

current=`oc get route -l type=bluegreen -o  custom-columns=SERVICE:.spec.to.name --no-headers`

if [ ${current} == 'green' ]
then
  newstate='blue'
  oc set route-backends bluegreen blue=25 green=75
  sleep 3
  oc set route-backends bluegreen blue=100 green=100
  sleep 3
  oc set route-backends bluegreen blue=75 green=25
  sleep 3
  oc set route-backends bluegreen blue=100 green=0
elif [ ${current} == 'blue' ]
then
  newstate='green'
  oc set route-backends bluegreen green=25 blue=75
  sleep 3
  oc set route-backends bluegreen green=100 blue=100
  sleep 3
  oc set route-backends bluegreen green=75 blue=25
  sleep 3
  oc set route-backends bluegreen green=100 blue=0

fi
echo "CURRENT STATE=${current}"
echo "NEW STATE=${newstate}"

sleep 2
