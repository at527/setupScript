#!/bin/bash

echo "Upgrading Packages"
# Update Packages
rpm-ostree upgrade -y

echo "Installing Gnome Tweaks"
# Add gnome-tweaks
rpm-ostree install gnome-tweaks -y

# echo "Enabling RPMFusion"
# Add RPMFusion
# rpm-ostree install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# echo "Installing Media Codecs"
# Add codecs
# rpm-ostree groupupdate core -y
# rpm-ostree groupupdate -y multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
# rpm-ostree groupupdate -y sound-and-video

echo "Adding Flathub"
# Add Flathub
flatpak remote-add -y --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Installing Zoom, Slack, Discord, Firefox"
# Install Apps
# Zoom, Slack, Discord
flatpak install -y flathub us.zoom.Zoom com.slack.Slack com.discordapp.Discord org.mozilla.firefox

echo "Downloading and installing Chrome"
# Chrome
wget -P ~/Downloads https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
rpm-ostree install -y ~/Downloads/google-chrome-stable_current_x86_64.rpm

echo "Setup Complete. Please Reboot."
