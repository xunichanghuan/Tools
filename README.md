# 自用脚本文件

## gce.sh
一键开启谷歌云服务器密码登录功能
本脚本也适用于AWS EC2/Lightsail, AZURE。。。。

创建实例时，点击添加启动脚本，复制下面代码，然后等待实例开通。


## rclone-auto-start.sh
`
wget -O rcloned https://raw.githubusercontent.com/xunichanghuan/Tools/master/rclone-auto-start.sh
"
mv rcloned /etc/init.d/
"
chmod +x /etc/init.d/rcloned
"
update-rc.d -f rcloned defaults
"
bash /etc/init.d/rcloned start
`
## rclone-auto-upload.sh
cd ~ && wget -N https://raw.githubusercontent.com/xunichanghuan/Tools/master/rclone-auto-upload.sh && chmod +x rclone-auto-upload.sh && nano .aria2/aria2.conf 

然后再到Aria2配置文件中加上一行on-download-complete=/root/rclone-auto-upload.sh即可，后面为脚本的路径。最后重启Aria2生效。
