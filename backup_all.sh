#!/bin/bash
#Комментарий
#rsync -avrR / /home/pi/backup/
dmgv=$(date +%e-%m-%G%H%M%S)
hn=$(hostname)

echo "Сохранили личность $hn и конфиг.томл"
rsync -avrR /etc/pwnagotchi/ /home/pi/backup/
echo "Сохранили все из /etc/pwnagotchi/"
rsync -avrR /root/ /home/pi/backup/
echo "Сохранили все логи"
rsync -avrR /var/log/pwn* /home/pi/backup/
echo "Сохранили все плагины"
rsync -avrR /usr/local/share/pwnagotchi/ /home/pi/backup/
echo "Сохранили настройки экранов"
rsync -avrR /usr/local/lib/python3.7/dist-packages/pwnagotchi/ /home/pi/backup/
echo "Сохранили все сессии"
rsync -avrR /var/tmp/pwnagotchi/sessions/ /home/pi/backup/
echo "Сохранили конфиг.тхт"
rsync -avrR /boot/config.txt /home/pi/backup/
echo "Сохранили измененный сервис грид"
rsync -avrR /etc/systemd/system/pw* /home/pi/backup/

cp /backup_all.sh /home/pi/backup/

tar -c -f backup-$hn-$dmgv.tar home/pi/backup/
gzip -9 backup-*
mv backup-* /home/pi/  
echo "ОПЕРАЦИЯ ВЫПОЛНЕНА в $dmgv"

