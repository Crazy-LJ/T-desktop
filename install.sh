#!/data/data/com.termux/files/bin/bash

updater() {
echo -e "[*]UPDATING_DATABASE~...."
apt-get update && apt-get upgrade
echo -e "[*]UPDATING......~...done"
}

main_install() {
echo -e "[*]INSTALLING_MAIN_PACKAGES~....."
echo -e "[*]SELECTING_PACKAGED~>...."
apt install xfce4 audacious  audacious-plugins adwaita-icon-theme arqiver -y 
apt install dbus-glib  xfwm4 xfce4-* xcb-* xcompmgr webkit2gtk sdl2 -y 
apt install pulseaudio pulseaudio-* git calc calcurse desktop-file-utils -y
apt install feh fontconfig-utils fsmon gtk4 gtk2 gtk3 wireshark-gtk -y
apt install pinentry-gtk leafpad gpg-crypter loqui imagemagick man -y
apt install termux-api thunar vim xorg-* azpainter roxterm  otter-browser -y
apt install startup-notification netsurf obconf dbus sdl2-mixer -y

}

#COLOUR
G='\033[32m'
R='\033[31m'
re='\033[0m'

# STARTING INSTSLLATION
echo -e " $R [*]STARTING TO INSALATIONS $re "
sleep 2s
echo -e " $G UPDATING $re "

updater

echo -e " $G INSTALLING $re "
sleep 1s

main_install

sleep 2s

echo -e " $R [FIXING BROKEN PACKAGES $re "
apt autoremove
apt clean

updater


echo -e " $G ..../done $re "

# FRAME WORK

sleep 1s
clear

echo -e " $R [*]SETTING UP VNC $re "
apt install tigervnc
vncserver -localhost
sleep 1s


home=/data/data/com.termux/files/home
data=$home/T-desktop/resource
usr=/data/data/com.termux/files/usr
cat $data/xstartup > $home/.vnc/xstartup

cat $data/display >> $usr/etc/profile


cat $data/motd > $usr/etc/motd

cp $data/vncstop $usr/bin
chmod +x $usr/bin/vncstop
cp $data/vncstart $usr/bin
chmod +x $usr/bin/vncstart

vncserver -kill :1

echo -e " $R PLEASE RESTART TERMUX "

echo -e " $G Termux-Desktop:
 * To start vnc server ; vncstart
 * To stop vnc server  ; vncstop
 * Install x11 repo tools by running apt list
   eg: package/x11 "
