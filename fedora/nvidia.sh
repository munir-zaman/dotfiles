#!/bin/sh
echo "===== INSTALLING NVIDIA DRIVERS ====="
/sbin/lspci | grep -e VGA
sudo dnf5 update -y # and reboot if you are not on the latest kernel
sudo dnf5 install akmod-nvidia # rhel/centos users can use kmod-nvidia instead
sudo dnf5 install xorg-x11-drv-nvidia-cuda #optional for cuda/nvdec/nvenc support

echo "===== DRIVER INSTALL COMPLETE ====="
echo "run modinfo -F version nvidia to see if they are properly installed!!"
