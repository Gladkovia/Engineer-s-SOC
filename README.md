# Engineer-s-SOC-
                          Тестовое задание 1 на SOC инженера

Для запуска 2HA на парке серверов Linux Ubuntu 20.4 LTS, требуется выполнить следующее:

1. git clone git@github.com:Gladkovia/Engineer-s-SOC.git
 на сервере управления Ansible.
2. Подготовить парк серверов для подключения по ssh public key, в данном примере пользователь "user"
 "user" - будет выполнять роль администратора. т.е. будет иметь полномочия подключаться к серверам только по public key
  данные привилегии требуются для возможного конфигурирования серверов
3. Для того что-бы завести пользователя с правами указанных в задании требуется внести изменения в файл /roles/gouth/defaults/main.yaml
  указать имя пользователя, группу, пароль - пароль будет сконфигурирован по требованиям политики безопасности.
4. В файле host.txt требуется указать ip адреса серверов на которые будет распространяться палитика -public key + 2HA
5. Запускаем ansible-playbook goaut.yml -b -kK, заданые флаги нужны для администратора "user" вводим пароль.
6. После выполнения процедуры ansible, первый вход требуется выполнить по ssh пользователь@ххх.ххх.ххх.ххх на сервер(ы) указанный(е) в файле host.txt

- В данной ветки запушу инфраструктуру Terraform для AWS
- https://github.com/Gladkovia/Terraform-for-2HA
- Готов предоставить доступ к AWS настроен и Terraform and Ansible для демонстрации стенда 

                           Тестовое задание 2 на SOC инженера
                           
https://hub.docker.com/r/besedi/test_docker                           
                           
1. http(80) - не защищённый ssl(443) - переконфигурировать 
2. права на конфигурационные файлы passwd (0777)- 4755 , shadow (0640) - 0000
3. Заголовок запроса содержит данные о сервере WSGIServer/0.1 Python/2.7.18
4. Отсутствует заголовок X-Content-Type-Options
5. Добавив этот заголовок X-XSS-Protection, можно защититься от некоторых атак MIME

                            Тестовое задание 3 на SOC инженера
                           
I. Первичные логи, которые трубутся для сбора и анализа 

1.  Syslog с пограничников или access-list есть програмные межсетевые экраны.
2.  WinLog с контроллера домена, а именно Security.
3.  Антивирус какой стоит с того и собираем.
4.  Базы данных, в которых должно быть включено логирование.
5.  Логи с web сервисов, а именно access log
6.  DLP системы, если существуют в контуре компании
7.  Loging с VPN сервисов
8.  IPS/IDS логирование, для анализа внешних угроз и сигнатур
9.  Syslog с Linux серверов авторизация
10. Логирование с виртуальных систем
  
II. Возможные проблемы.

1. Надежность и гарантия доставки
2. Подключение новых получателей.
3. Интерациия разных стеков.
- Решение - Kafka


III. Архитектура.

1. Лог коллектор/коннекторы - Splunk, ArcSight
2. Деспечер логов, морашрутизация - Apache Kafka
3. Аналитика - Splunk, ArcSight
- Если судить по тому, как крупные структуры (NASA, FBI, Все ТОП Банки и.т.д.) Америки ищут кандидатов то стеку SIEM  ArcSight + Splunk, думаю совокупность двух систем, даст очень хороший результат.
- ArcSight на физические офисы.
- Splunk на облоко и датаценты.

IV. Нормализация и качества данных

- Посредством встроеного инструментария (Splunk) или того-же (Zabbix).
- Зачем - Отслеживание реальных сообщений без потери качества соблюдение SLA и расследование инцидентов. 

V. Дополнительные меры

- Заложить ресурсные требования, с целью безболезненного увеличения нагрузки потока данных, так-же количество сроков хранения в базе данных как пример (PCI DSS).
- Предусмотреть балансеровщики нагрузки.
- Обеспечение архивирования данных.
- Предусмотреть pool лицензий, на ПО.
- Предусмотреть тех. поддержку существующего ПО.
- Предусмотреть отказоустойчивость.
- Предусмотреть Единый центр мониторинг (SOC).
- Подготовка персонала.


P.S.

Доступ к серверам могу организовать в AWS, но из-за санкций долго держать их запущенными не смогу, заблокируют учетку (привязана к карте :().
