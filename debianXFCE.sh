#!/bin/bash

echo "Installing Desktop Environment"
apt install --install-suggests xfce4

echo "Installing Sudo"
apt install -y sudo

# Visual Customizations
#sh -c "echo 'deb http://ppa.launchpad.net/papirus/papirus/ubuntu focal main' > /etc/apt/sources.list.d/papirus-ppa.list"

#echo "Downloading Papirus Icons"
#apt-get install  -y dirmngr
#apt-key adv -y --recv-keys --keyserver keyserver.ubuntu.com E58A9D36647CAE7F
#apt-get update -y
#apt-get install -y papirus-icon-theme

#echo "Installing Papirus Icons"
#wget -qO- https://git.io/papirus-icon-theme-install | sh

echo "Installing Flatpak and Flathub"
apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

reboot

echo "Installing Firefox, VLC, Slack, Zoom"
flatpak install -y flathub us.zoom.Zoom com.slack.Slack org.mozilla.firefox org.videolan.VLC

echo "Download Chrome"
wget -P ~/Downloads https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.deb

echo "Install Chrome"
apt install -y ~/Downloads/google-chrome-stable_current_x86_64.deb

ehco "Install Synaptic"
apt install -y synaptic


apt update
apt upgrade
