#!/bin/bash

echo "Disable Suspend"
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target

echo "Upgrading Packages"
# Update Packages
sudo dnf upgrade -y

echo "Installing Gnome Tweaks"
# Add gnome-tweaks
sudo dnf install gnome-tweaks -y

echo "Enabling RPMFusion"
# Add RPMFusion
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "Installing Media Codecs"
# Add codecs
sudo dnf groupupdate core -y
sudo dnf groupupdate -y multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate -y sound-and-video

echo "Adding Flathub"
# Add Flathub
flatpak remote-add -y --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Installing Zoom, Slack, Firefox"
# Install Apps
# Zoom, Slack, VLC
flatpak install -y flathub us.zoom.Zoom com.slack.Slack org.mozilla.firefox org.videolan.VLC

echo "Downloading and installing Chrome"
# Chrome
wget -P ~/Downloads https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo dnf install -y ~/Downloads/google-chrome-stable_current_x86_64.rpm
