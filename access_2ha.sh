#!/bin/bash

access_new=$(last | grep $USER | tail -2 | awk '{print$1}' | wc -l)

user=$(echo $USER)
access=$(grep $USER /etc/ssh/two-factor-skip.conf | awk '{print$1}')
add="$user ALL=(ALL) NOPASSWD:/usr/sbin/useradd,/usr/sbin/userdel,/usr/sbin/usermod,/var/log/syslog"
del="NOPASSWD:ALL"
search=$(sudo -l -U $user | grep "NOPASSWD: ALL" | awk '{print$3}')
all="ALL"

if [ "$access_new" == "1" ]
 then
  exec "/usr/bin/google-authenticator"
 elif [ "$access_new" != "1" ]
 then
  echo ""
fi

if [ "$access" == "+" ]
 then
 sudo sed -i "/$user/d" /etc/ssh/two-factor-skip.conf
fi

if [ "$search" != "$all" ]
 then
 echo ""
 elif [ "$search" == "$all" ]
 then
 sudo sh -c "echo '$add' > /etc/sudoers.d/$user"
fi


if [ "$access" == "+" ]
 then
  exec "/usr/bin/google-authenticator"
fi




