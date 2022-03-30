# Добавление и изменение данных в "черных списках" почтового клиента Thunderbird.
# 

В качестве почтового протокола используйте IMAP!

### Astra Linux 
1. **cd /opt**                                                          *перейти в каталог opt (каталог для дополнительных пакетов программ)*
2. **sudo git clone https://github.com/telegramcores/blacklist**        *клонируем репозиторий*
3. **cd blacklist**                                                     *переходим в папку с репозиторием*
4. **sudo chmod +x update_bl_thunderbird.sh**                           *делаем скрипт исполняемым*
5. **sudo crontab -e**                                                  *открываем настройки cron root-пользователя*
6. 0 */6 * * * /opt/blacklist/update_bl_thunderbird.sh                  *добавляем в cron строку запуска скрипта (для примера, каждые 6 часов. После строки должна быть обязательно пустая строка)*
7. **Ctrl+O + Enter** - сохраняем документ, **Ctrl+X** - выход из редактирования.

Тем самым, каждые 6 часов (по возможности)будет загружаться новый файл "с черным списком" и добавляться во все почтовые ящики пользователей, использующих Thunderbird.
В почтовом клиенте Thunderbird для требуемого почтового ящика нужно создать фильтр с именем "Черный список", дальше скрипт все обработает сам.

### Windows
1. Скачать и установить Thunderbird Portable на диск C: (имя папки - без пробелов)
2. Скопировать из папки Windows репозитория 4 файла в папку C:\ThunderbirdPortable
3. Запускать почтовый клиент через run.bat

*Очень удобно распространять настроенный клиент*


## Работа с "черным списком"
Для того, чтобы работал черный список, в любом из клиентов (хоть в Linux, хоть в Windows) нужно создать правило сортировки, как на изображении:
![Фильтр](https://github.com/telegramcores/blacklist/blob/main/blacklist.png)

Почтовые фильтры:
в Windows - ThunderbirdPortable\Data\profile\ImapMail\  далее может быть несколько папок. Настройки фильтра хранятся в файле msgFilterRules.dat. Если есть одна настроенная почта с фильтром и Вы создали другую, можно просто скопировать этот файл в новую папку. После перезапуска скрипта данные черного списка будут обновляться для всех указанных почтовых ящиков.
Файл info.txt можно разместить на своем ресурсе, заменив путь (строка с wget) в run.bat(Windows) и update_bl_thunderbird.sh (Linux). Можно дополнять файл своими исключениями, соблюдая структуру - это ВАЖНО! - лучше обработать файл msgFilterRules.dat на отдельном почтовом ящике и, если ошибок нет, добавить строку condition с исключениями в info.txt.
