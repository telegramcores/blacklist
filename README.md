# Добавление и изменение данных в "черных списках" почтового клиента Thunderbird.

# Linux 
1. cd ~                                                             // перейти в папку пользователя
2. git clone https://github.com/telegramcores/blacklist             // клонируем репозиторий
3. cd blacklist                                                     // переходим в папку с репозиторием
4. chmod +x update_bl_thunderbird.sh                                // делаем скрипт исполняемым
5. crontab -e                                                       // открываем ностройки cron пользователя
6. @reboot ~/blacklist/update_bl_thunderbird.sh                     // добавляем в cron запуск скрипта после перезагрузки

