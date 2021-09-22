#!/bin/bash

USR=
OS=linux
ARC=amd64
VER=v1.0.1

#update & install all essentials
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade
sudo apt install -y libgmp-dev nfs-common logrotate net-tools nmap speedtest-cli haveged tmux libsodium-dev cmake g++ git build-essential nvme-cli dstat sysstat glances smartmontools lm-sensors htop xfsprogs mdadm cpufrequtils wget curl
sudo snap install duf-utility

#copy all git folder
cd ~
git clone https://github.com/aryonp/xch

#install madmax plotter
cd ~
git clone https://github.com/madMAx43v3r/chia-plotter
cd chia-plotter
git submodule update --init
bash make_release.sh
sudo mv build/chia_plot /usr/bin

#install flexfarmer
cd ~
wget -c https://static.flexpool.io/dl/flexfarmer/flexfarmer-$OS-$ARC-$VER.tar.gz
sudo tar -xvf flexfarmer-$OS-$ARC-$VER.tar.gz
cd flexfarmer
sudo mv flexfarmer /usr/bin
cd ~
rm -rf flexfarmer/

#create scheduler
sudo crontab -l > tmpcron
echo "@reboot /home/$USR/xch/update.sh" >> tmpcron
echo "#@reboot /home/$USR/xch/farmer.sh" >> tmpcron
sudo crontab tmpcron
sudo rm tmpcron

#create log folder
cd ~
mkdir chialogs/
chmod 0755 ~/chialogs/

#copy logrotate config
cd ~/xch
sudo cp log-xch /etc/logrotate.d/

#extract info FROM Chia Blockchain
./extract.sh

#back to home
cd ~