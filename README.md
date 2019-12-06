# 自用脚本文件

## gce.sh
一键开启谷歌云服务器密码登录功能
本脚本也适用于AWS EC2/Lightsail, AZURE。。。。

创建实例时，点击添加启动脚本，复制下面代码，然后等待实例开通。


## rclone-auto-start.sh rclone-auto-upload.sh
```
wget -N https://raw.githubusercontent.com/xunichanghuan/Tools/master/aria2-auto-start.sh && chmod +x aria2-auto-start.sh && bash aria2-auto-start.sh
```

说明：我们很多人喜欢用VPS做离线下载，不过由于有的服务器硬盘太小了，装不了太多电影资源啥的，我们就需要想办法了，之前说过可以通过挂载FTP来增大空间，参考：Linux VPS通过安装CurlFtpFS来挂载FTP，这里再说个挂载Google Drive网盘的方法，毕竟Google Drive有15G免费的空间，有的也有无限空间，都可以利用上去。

说明
本教程只适用Debian/Ubuntu系统，如果你是CentOS或者其它Linux系统，请使用以下命令安装rclone：

```curl https://rclone.org/install.sh | sudo bash```
初始化配置和挂载方法和下面一样，开机自启可参考该教程→传送门。

# 安装
## 1、安装rclone

```wget https://www.moerats.com/usr/shell/rclone_debian.sh && bash rclone_debian.sh```

## 2、初始化配置

```rclone config```

## 3、挂载为磁盘

#新建本地文件夹，路径自己定，即下面的LocalFolder
```mkdir /GoogleDrive```
#挂载为磁盘，下面的DriveName、Folder、LocalFolder参数根据说明自行替换

```rclone mount DriveName:Folder LocalFolder --copy-links --no-gzip-encoding --no-check-certificate --allow-other --allow-non-empty --umask 000```

DriveName为初始化配置填的name，Folder为Google Drive里的文件夹，LocalFolder为VPS上的本地文件夹。

挂载成功后，输入df -h命令查看即可！

## 4、卸载磁盘

```fusermount -qzu LocalFolder```
# 开机自启
先新建systemd配置文件，适用CentOS 7、Debian 8+、Ubuntu 16+。

再使用命令：
```
#将后面修改成你上面手动运行命令中，除了rclone的全部参数
command="mount GoogleDrive: /GoogleDrive --copy-links --no-gzip-encoding --no-check-certificate --allow-other --allow-non-empty --umask 000"
#以下是一整条命令，一起复制到SSH客户端运行
cat > /etc/systemd/system/rclone.service <<EOF
[Unit]
Description=Rclone
After=network-online.target

[Service]
Type=simple
ExecStart=$(command -v rclone) ${command}
Restart=on-abort
User=root

[Install]
WantedBy=default.target
EOF
```
开始启动：
```systemctl start rclone```

设置开机自启：
```systemctl enable rclone```

其他命令：

重启：```systemctl restart rclone```

停止：```systemctl stop rclone```

状态：```systemctl status rclone```

如果你想挂载多个网盘，那么将systemd配置文件的rclone.service改成rclone1.service即可，重启动什么的同样换成rclone1。
