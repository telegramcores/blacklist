@echo off
(echo.set sh=CreateObject^("Wscript.Shell"^)
echo.sh.Run """%~nx0"" 1", 0)>launch.vbs
if "%~1"=="" (start "" "launch.vbs"&exit /b)

Ping -n 2 1.1.1.1 2>nul|Find "TTL=">nul
if %ERRORLEVEL% EQU 1 goto startTB
start /wait wget https://raw.githubusercontent.com/telegramcores/blacklist/main/info.txt -O info.txt
chcp 1251
:: дополнение и исправление blacklist для 5 строки ниже
for /F "delims=" %%i in (info.txt) do set bl="%%i"
set bl=%bl:"=""%
set bl=%bl:~2,-2%
for /r "Data\profile\ImapMail\" %%i in (msgFilterRules.dat) do (
start sed -i "/Черный список/,+5s/condition.*/%bl%/" %%i
)
:: дополнение и исправление blacklist для 7 строки ниже
for /F "delims=" %%i in (info.txt) do set bl="%%i"
set bl=%bl:"=""%
set bl=%bl:~2,-2%
for /r "Data\profile\ImapMail\" %%i in (msgFilterRules.dat) do (
start sed -i "/Черный список/,+7s/condition.*/%bl%/" %%i
)

:startTB
ThunderbirdPortable.exe
