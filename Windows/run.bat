ping ya.ru |>nul find /i "TTL=" && (

start /wait wget https://raw.githubusercontent.com/telegramcores/blacklist/main/info.txt -O info.txt

chcp utf-8
:: дополнение и исправление blacklist для 5 строки ниже
for /F "delims=" %%i in (info.txt) do set bl="%%i"
set bl=%bl:"=""%
set bl=%bl:~2,-2%
for /r "C:\test\" %%i in (msgFilterRules.dat) do (
start sed -i "/Черный список/,+5s/condition.*/%bl%/" %%i
)

:: дополнение и исправление blacklist для 7 строки ниже
for /F "delims=" %%i in (info.txt) do set bl="%%i"
set bl=%bl:"=""%
set bl=%bl:~2,-2%
for /r "C:\test\" %%i in (msgFilterRules.dat) do (
start sed -i "/Черный список/,+7s/condition.*/%bl%/" %%i
)
)
