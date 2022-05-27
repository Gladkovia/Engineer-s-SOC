#!/bin/bash

user=$(echo $USER)

access=$(grep $USER /etc/ssh/two-factor-skip.conf | awk '{print$1}')
add="$user ALL=(ALL) NOPASSWD:/usr/sbin/useradd,/usr/sbin/userdel,/usr/sbin/usermod,/var/log/syslog"



if [ "$access" == "+" ]
 then
 sudo sed -i "/$user/d" /etc/ssh/two-factor-skip.conf
fi

sudo sh -c "echo '$add' > /etc/sudoers.d/$user"

if [ "$access" == "+" ]
 then
  exec "/usr/bin/google-authenticator"
fi

