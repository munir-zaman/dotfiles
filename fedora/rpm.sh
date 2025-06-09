#!/bin/sh
# See (https://rpmfusion.org/Configuration) for more info

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

sudo dnf update @core
sudo dnf install rpmfusion-\*-appstream-data

# See (https://rpmfusion.org/Howto/Multimedia) for more info
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf install libva-nvidia-driver

sudo dnf install rpmfusion-nonfree-release-tainted
sudo dnf --repo=rpmfusion-nonfree-tainted install "*-firmware"

# sudo dnf groupupdate sound-and-video
# sudo dnf install nvidia-vaapi-driver
