#!/bin/bash
# Script made by mirochu, do what you want with it lol
# please execute it AS ROOT because idk if you use doas or sudo
if [ "$EUID" -ne 0 ]
  then echo "Please run this script as root"
  exit
fi
echo "Installing primary keys, more info at https://aur.chaotic.cx/"
pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com > /dev/null 2>&1
pacman-key --lsign-key FBA220DFC880C036 > /dev/null 2>&1
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' --noconfirm > /dev/null 2>&1
echo "adding Chaotic AUR repos to pacman.conf"
echo "#line added by chaotic script" >> /etc/pacman.conf
echo [chaotic-aur] >> /etc/pacman.conf
echo "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf
echo "Updating repos"
pacman -Syy > /dev/null 2>&1
echo "All Done!"
