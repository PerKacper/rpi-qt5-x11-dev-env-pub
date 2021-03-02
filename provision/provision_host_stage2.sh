#!/bin/bash

rsync -avzR --rsync-path="sudo rsync" --delete pi@rpidev:{/lib,/usr/include,/usr/lib,/opt/vc} ~/rpi/sysroot

cp /vagrant/provision/source/sysroot-relativelinks.py ~/rpi
chmod a+x ~/rpi/sysroot-relativelinks.py
~/rpi/sysroot-relativelinks.py ~/rpi/sysroot

# RPi4: -device linux-rasp-pi4-v3d-g++
# RPi3: -device linux-rasp-pi3-vc4-g++
cd ~/rpi/build
../qt-everywhere-src-5.15.0/configure -release -opengl es2 -eglfs -device linux-rasp-pi4-v3d-g++ -device-option CROSS_COMPILE=~/rpi/tools/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf- -sysroot ~/rpi/sysroot -prefix /usr/local/qt5.15 -extprefix ~/rpi/qt5.15 -opensource -confirm-license -skip qtscript -skip qtwayland -skip qtwebengine -nomake tests -make libs -pkg-config -no-use-gold-linker -v -recheck

make
make install

cd ~/rpi

rsync -avz --rsync-path="sudo rsync" ~/rpi/qt5.15 pi@rpidev:/usr/local

# you can run qopenglwidget in X11
# you can run it in fb by executing ./qopenglwiget -platform linuxfb but it not shows animation

chmod a+x /vagrant/provision/source/qt-creator-opensource-linux-x86_64-4.14.1.run
