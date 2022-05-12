# Engineer-s-SOC-
1. Создаем группу пользователя groupadd soc
2. Создаем пользователя useradd socuser -g soc -b /home/soc -s /bin/bash
3. Добавляем пользователю права sudo username ALL=(ALL) NOPASSWD:/usr/sbin/useradd,/usr/sbin/userdel,/usr/sbin/usermod
5. Создаем директорию nano /home/socuser/.ssh/authorized_keys
6. Назначаем права на файл sudo chmod 402 /home/socuser/.ssh/authorized_keys
7. Добавляем публичный ключь sudo cat  /home/user/.ssh  >  /home/socuser/.ssh/authorized_keys
8. Меняем права на файл sudo chmod 400 /home/socuser/.ssh/authorized_keys
9. Открываем доступ авторизации полько по ключу 
RSAAuthentication yes
PubkeyAuthentication yes
AuthorizedKeysFile      %h/.ssh/authorized_keys
