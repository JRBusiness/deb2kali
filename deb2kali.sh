#!/bin/bash -v

### Install needed packages
apt update
apt install -y dirmngr

### Add the Kali Linux GPG keys to aptitude ###
apt-key adv --keyserver hkp://keys.gnupg.net --recv-key 7D8D0BF6

### Replace the Debian repos with Kali repos ###
mv /etc/apt/sources.list /etc/apt/sources.list.debian
cat <<EOF > /etc/apt/sources.list
deb http://http.kali.org/kali kali-rolling main non-free contrib
deb-src http://http.kali.org/kali kali-rolling main non-free contrib
EOF

### Update and install base packages ###
apt update
apt -y upgrade
apt -y dist-upgrade
apt -y autoremove --purge
#apt -y install kali-linux
#apt -y install kali-linux-top10
apt -y install kali-linux-full
#apt -y install kali-linux-all

### Install xfce4 desktop environment ###
apt install kali-defaults kali-root desktop-base xfce4 xfce4-places-plugin xfce4-goodies
update-alternatives --config x-session-manager
### Select the option xfce4 ###

### Install GIT ###
apt install git

### Downgrade specific packages to their Kali Linux versions ###
### * Commented out since this is currently no longer necessary (2017-09-17).
###   Leaving it for future reference just in case.
#apt -y --force-yes install tzdata=2015d-0+deb8u1
#apt -y --force-yes install libc6=2.19-18
#apt -y --force-yes install systemd=215-17+deb8u1 libsystemd0=215-17+deb8u1
#
### Double-check that nothing else needs to be updated ###
apt update
apt -y upgrade
apt -y dist-upgrade

### Clean up ###
apt -y autoremove --purge
apt clean
echo Done.
