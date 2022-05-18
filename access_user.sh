#!/bin/bash

access=$(last | grep $USER | tail -1 | awk '{print$1}')

if [ "$access" != "$1" ]
 then 
  exec "/usr/bin/google-authenticator" 
 elif [ "$access" = "$1" ]  
 then
  echo "Hello"
fi  
