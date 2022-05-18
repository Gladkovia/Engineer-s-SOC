#!/bin/bash

access=$(cat /var/log/syslog | grep publickey |  tail -1 | awk '{print$17}')

if [ "$access" = "publickey" ]
 then
  exec "/usr/bin/google-authenticator"
 elif [ "$access" != "$1" ]
 then
  echo "Hello"
fi

