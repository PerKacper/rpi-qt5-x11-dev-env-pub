#!/bin/bash

# based on https://github.com/UvinduW/Cross-Compiling-Qt-for-Raspberry-Pi-4
sudo apt update
sudo apt -y upgrade

sudo apt -y install sshpass

ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
echo "192.168.136.157 rpidev" | sudo tee -a /etc/hosts
sshpass -p "raspberry" ssh-copy-id -f pi@rpidev

sudo apt -y install build-essential
sudo apt -y install gcc git bison python gperf pkg-config gdb-multiarch

# this is outdated version of qtcreator - use installer instead
# sudo apt -y install qtcreator

sudo apt -y autoremove

mkdir ~/rpi ~/rpi/build ~/rpi/tools ~/rpi/sysroot ~/rpi/sysroot/usr ~/rpi/sysroot/opt

tar -xf /vagrant/provision/source/qt-everywhere-src-5.15.0.tar.xz -C ~/rpi
cp -R ~/rpi/qt-everywhere-src-5.15.0/qtbase/mkspecs/linux-arm-gnueabi-g++ ~/rpi/qt-everywhere-src-5.15.0/qtbase/mkspecs/linux-arm-gnueabihf-g++
sed -i -e 's/arm-linux-gnueabi-/arm-linux-gnueabihf-/g' ~/rpi/qt-everywhere-src-5.15.0/qtbase/mkspecs/linux-arm-gnueabihf-g++/qmake.conf

tar -xf /vagrant/provision/source/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf.tar.xz -C ~/rpi/tools

scp /vagrant/provision/provision_rpi.sh pi@rpidev:/home/pi
