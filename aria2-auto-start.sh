#!/bin/bash

cd ~
mkdir -p /GoogleDrive/
wget -O rcloned https://raw.githubusercontent.com/xunichanghuan/Tools/master/rclone-auto-start.sh
mv rcloned /etc/init.d/
chmod +x /etc/init.d/rcloned
update-rc.d -f rcloned defaults
bash /etc/init.d/rcloned start

mkdir -p /Download/
wget -N https://raw.githubusercontent.com/xunichanghuan/Tools/master/rclone-auto-upload.sh
chmod +x rclone-auto-upload.sh
echo "on-download-complete=/root/rclone-auto-upload.sh" >>/root/.aria2/aria2.conf
service aria2 restart
