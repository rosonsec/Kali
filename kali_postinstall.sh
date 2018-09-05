#!/bin/bash
# Kali Postinstall script by rosonsec

# Kali Rolling Repository
if ! grep -q kali-rolling /etc/apt/sources.list
  then echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list
fi

# VirtualBox Guest Additions
apt-get update 
apt-get install -y virtualbox-guest-x11

# Settings -> Privacy -> Screen Lock -> Off
gsettings set org.gnome.desktop.session idle-delay 0

# Metasploit autostart
service postgresql start
update-rc.d postgresql enable
msfdb init
msfconsole
db_rebuild_cache

# Vim settings
echo "set tabstop=4" >> /etc/vim/vimrc
echo "set shiftwidth=4" >> /etc/vim/vimrc
echo "set softtabstop=4" >> /etc/vim/vimrc
echo "set expandtab" >> /etc/vim/vimrc

# System restart
reboot
