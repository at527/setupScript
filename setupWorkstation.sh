#!/bin/bash

echo "Disable Suspend"
systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target

echo "Installing Gnome Tweaks"
# Add gnome-tweaks
dnf install gnome-tweaks -y

echo "Adding Flathub"
# Add Flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Installing Zoom, Slack, Firefox"
# Install Apps
# Zoom, Slack, VLC
flatpak install flathub us.zoom.Zoom com.slack.Slack org.mozilla.firefox org.videolan.VLC

echo "Downloading and installing Chrome"
# Chrome
wget -P ~/Downloads https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
dnf install -y ~/Downloads/google-chrome-stable_current_x86_64.rpm

echo "Upgrading Packages"
# Update Packages
dnf upgrade -y

echo "Enabling RPMFusion"
# Add RPMFusion
dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "Installing Media Codecs"
# Add codecs
dnf groupupdate core -y
dnf groupupdate -y multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
dnf groupupdate -y sound-and-video
