if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
  wget -N https://raw.githubusercontent.com/telegramcores/blacklist/main/info.txt -O info.txt
    if [[ -s info.txt ]]; then
        find /home/*/.thunderbird -name "msgFilterRules.dat" -exec sed -i "/Черный список/,+5s/condition.*/$(<info.txt)/" {} +
        # если будут добавлены дополнительные строки в поле "Производить следующие действия:", например пересылка на другую почту, проверяем еще 7 строку
        find /home/*/.thunderbird -name "msgFilterRules.dat" -exec sed -i "/Черный список/,+7s/condition.*/$(<info.txt)/" {} +
    fi  
fi
