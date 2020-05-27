#!/bin/bash
# Kali Postinstall script by rosonsec

# Kali Rolling Repository
if ! grep -q kali-rolling /etc/apt/sources.list
  then echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list
fi

apt-get update 

# if Virtual Box
# VirtualBox Guest Additions
#apt-get install -y virtualbox-guest-x11

# if Vmware
## Open Vmware Tools
#apt-get install -y open-vm-tools

# if Gnome
## Settings -> Privacy -> Screen Lock -> Off
#gsettings set org.gnome.desktop.session idle-delay 0

## Settings -> Power -> Automatic Suspend -> Off
#gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
#gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'

# Metasploit autostart
sudo service postgresql start
sudo update-rc.d postgresql enable

# Metasploit DB init
sudo msfdb init
#Todo
#msfconsole -x db_rebuild_cache;exit

# Vim user settings
echo "set tabstop=4" >> ~/.vimrc
echo "set shiftwidth=4" >> ~/.vimrc
echo "set softtabstop=4" >> ~/.vimrc
echo "set expandtab" >> ~/.vimrc

# Terminator
sudo apt-get install -y terminator
[ -d ~/.config/terminator ] || mkdir -p  ~/.config/terminator
wget --no-check-certificate https://raw.githubusercontent.com/rosonsec/Kali/master/conf/terminator.conf -O ~/.config/terminator/config

## System restart
#reboot
