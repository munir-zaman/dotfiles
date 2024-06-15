#/bin/sh

sudo dnf5 install python3-pip
# https://github.com/dylanaraps/pywal
sudo pip3 install pywal
# REF: https://github.com/Frewacom/pywalfox
sudo pip3 install pywalfox
pywalfox install
