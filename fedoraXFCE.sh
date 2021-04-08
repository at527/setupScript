#!/bin/bash

### Disables suspend for devices that don't suspend properly.
echo "Disable Suspend"
systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
###

### Enable EarlyOOM for devices with low ram
dnf install earlyoom
systemctl enable --now earlyoom
###

### Increase Zram Fraction for devices with low ram
mv /etc/systemd/zram-generator.conf /etc/systemd/zram-generator.conf.bk
printf "[zram0]\nzram-fraction=1\nmax-zram-size=4096\n" >> /etc/systemd/zram-generator.conf
###

### Add Papirus Icons for better visuals
dnf install papirus-icon-theme
### 

echo "Adding Flathub"
# Add Flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Installing Flatpak Apps"
# Install Apps
# Zoom, Slack, VLC
flatpak install -y flathub org.mozilla.firfox
flatpak install -y flathub us.zoom.Zoom 
# flatpak install -y flathub com.slack.Slack 
flatpak install -y flathub org.videolan.VLC

### Not installing Chrome to keep installation light
# echo "Downloading and installing Chrome"
# wget -P ~/Downloads https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
# dnf install -y ~/Downloads/google-chrome-stable_current_x86_64.rpm
###

echo "Upgrading Packages"
# Update Packages
dnf upgrade -y

### These are disabled to keep Fedora XFCE light.
# echo "Enabling RPMFusion"
# dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# echo "Installing Media Codecs"
# dnf groupupdate core -y
# dnf groupupdate -y multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
# dnf groupupdate -y sound-and-video
###
