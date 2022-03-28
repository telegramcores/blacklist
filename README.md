# Добавление и изменение данных в "черных списках" почтового клиента Thunderbird.

# Astra Linux 
1. cd /opt                                                          *_ перейти в каталог opt (каталог для дополнительных пакетов программ)
2. sudo git clone https://github.com/telegramcores/blacklist        *_ клонируем репозиторий
3. cd blacklist                                                     *_ переходим в папку с репозиторием
4. sudo chmod +x update_bl_thunderbird.sh                           *_ делаем скрипт исполняемым
5. sudo crontab -e                                                  *_ открываем настройки cron root-пользователя
6. 0 */6 * * * /opt/blacklist/update_bl_thunderbird.sh              *_ добавляем в cron строку запуска скрипта (для примера, каждые 6 часов. После строки должна быть обязательно пустая строка)

Тем самым, каждые 6 часов (по возможности)будет загружаться новый файл "с черным списком" и добавляться во все почтовые ящики пользователей, использующих Thunderbird.
В почтовом клиенте Thunderbird нужно создать фильтр с именем "Черный список", дальше скрипт все обработает сам.
