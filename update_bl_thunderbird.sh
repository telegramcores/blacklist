wget https://raw.githubusercontent.com/telegramcores/blacklist/main/bl.txt -O info.txt
find ~/.thunderbird -name "msgFilterRules.dat" -exec sed -i "/Черный список/,+5s/condition.*/$(<info.txt)/" {} +
