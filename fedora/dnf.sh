#!/bin/sh
# This script should be run as sudo
echo "Setting up dnf..."
dnfpath="/etc/dnf/dnf.conf"
# copy original dnf file
cp $dnfpath "$(pwd)/dnf.conf.bak"
# write new dnf.conf
echo "" 					 > $dnfpath
echo "[main]" 					>> $dnfpath
echo "gpgcheck=True"				>> $dnfpath
echo "installonly_limit=3"			>> $dnfpath
echo "clean_requirements_on_remove=True"	>> $dnfpath
echo "best=False"				>> $dnfpath
echo "skip_if_unavailable=True"			>> $dnfpath
echo "assumeyes=True"				>> $dnfpath
echo "color=always"				>> $dnfpath
echo "deltarpm=True"				>> $dnfpath
echo "keepcache=True"				>> $dnfpath
echo "metadate_expire=1"			>> $dnfpath
echo "fastestmirror=True"			>> $dnfpath
echo "max_parallel_downloads=10"		>> $dnfpath
echo "minrate=50000"				>> $dnfpath

systemctl enable --now dnf-makecache.timer

cat $dnfpath
dnf install dnf5
