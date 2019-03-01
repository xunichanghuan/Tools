#!/bin/bash

#更改root用户密码使用下面命令
echo root:imxtest |sudo chpasswd root

#允许root账户登录
sudo sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config;

#允许用户使用密码登录
sudo sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config;

sudo reboot
