#!/bin/bash

#get the ip and set it to a variable
ip0="$(curl -s www.icanhazip.com)"

#now check it again just to make sure and set to another variable
ip1="$(curl -s www.icanhazip.com)"

#now if they don't match sendmail
while true ; do
	if [ $ip0 != $ip1 ]
  then
		echo $ip1 && mail -s "Your ip changed to $ip1!" </dev/null "youremail@yourdomain.com" && ip0=$ip1
  fi
	ip1="$(curl -s www.icanhazip.com)" #gotta get that ip 
  sleep 30 #check your ip every 30 sec
  ##The below is for testing purposes
  #echo checked ip
done
