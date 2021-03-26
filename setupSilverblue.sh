#!/bin/bash

# Update Packages
rpm-ostree update

# Add gnome-tweaks
rpm-ostree install gnome-tweaks -y

# Add RPMFusion
rpm-ostree install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Add codecs
rpm-ostree groupupdate core -y
rpm-ostree groupupdate -y multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
rpm-ostree groupupdate -y sound-and-video

# Add Flathub
flatpak remote-add -y --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install Apps
# Zoom, Slack, Discord
flatpak install -y flathub us.zoom.Zoom com.slack.Slack com.discordapp.Discord

# Chrome
wget -P ~/Downloads https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
rpm-ostree install -y ~/Downloads/google-chrome-stable_current_x86_64.rpm

echo Setup Complete. Please Reboot.
