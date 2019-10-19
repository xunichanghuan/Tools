#!/bin/bash

cd ~
wget -N https://raw.githubusercontent.com/xunichanghuan/Tools/master/rclone-auto-upload.sh
echo "on-download-complete=/root/rclone-auto-upload.sh" >>/root/.aria2/aria2.conf
service aria2 restart
