#!/bin/bash

user=$(echo $USER)
access=$(grep $USER /etc/ssh/two-factor-skip.conf | awk '{print$1}')
add="$user ALL=(ALL) NOPASSWD:/usr/sbin/useradd,/usr/sbin/userdel,/usr/sbin/usermod,/var/log/syslog"
#nopass=$(sudo cat /etc/sudoers.d/$user | grep NOPASSWD:AL | awk '{print$3}')
del="NOPASSWD:ALL"
search=$(sudo -l -U $user | grep "NOPASSWD: ALL" | awk '{print$3}')
all="ALL"


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




