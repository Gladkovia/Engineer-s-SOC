#!/bin/bash

filename="/etc/ssh/two-factor-skip.conf"

access=$(cat /var/log/syslog | grep "two-factor-skip.conf"  |  awk '{print$25,$27}' | awk 'FS="ALL#"{print$1}' | grep $USER | tail -2 | wc -l)
user=$(echo $USER)

sed -i -e 's/+ : user/- : user/'

if [ "$access" == "1" ]
 then
  exec "/usr/bin/google-authenticator"
 elif [ "$access" == "1" ]
 sudo sed -i "/$user/d" $filename
 then
fi
