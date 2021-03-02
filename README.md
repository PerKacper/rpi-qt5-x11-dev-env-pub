# README

- Run `download_sources` script to get needed files in the `source` folder

## Preparing Raspberry Pi - stage 1
- Unpack and burn Raspian on SD card
- Copy `source\ssh` file to `boot` partition of SD card to enable SSH server
- If you need WiFi network connection copy `source\wpa_supplicant.conf` to `boot` partition and edit WiFi data in this file
- Run RPi
- Find IP address of RPi
- Change IP address of RPi in `provision_host_stage1.sh` script (line 10)

## Preparing VM Ubuntu machine - stage 1
- Power up VM machine by `vagrant up`
- Ssh by `vagrant ssh` to VM machine
- Ping to RPi to check if it is available `ping rpidev`
- Run `/vagrant/provision/provision_host_stage1.sh` script

## Preparing Raspberry Pi - stage 2
- Ssh to RPi from VM by `ssh pi@rpidev`
- Run `~/provision_rpi.sh` script

## Preparing VM Ubuntu machine - stage 2 (compiling Qt - long)
- Change `-device` parameter in line 12 of `/vagrant/provision/provision_host_stage2.sh` script to desired device (tips inside the file)
- Run `/vagrant/provision/provision_host_stage2.sh` script

## Test simple Qt application in X11

Run on the VM

	cp -r ~/rpi/qt-everywhere-src-5.15.0/qtbase/examples/opengl/qopenglwidget ~/rpi/
	cd ~/rpi/qopenglwidget
	../qt5.15/bin/qmake
	make
	scp qopenglwidget pi@rpidev:/home/pi

...and then go to RPi and run `~/qopenglwidget` in X11 or `~/qopenglwidget -platform linuxfb` without X11

## Install QtCreator

QtCrator from apt repo is outdated. Install it from downloaded installator:
	/vagrant/provision/source/qt-creator-opensource-linux-x86_64-4.14.1.run

## Configure QtCreator

TODO

## Bugs

To fix bad keyboard layout in VM LUbuntu:
- run app Start -> Tools -> Fcitx
- right click on kayboard icon in tray -> Configure Current Input Method
- add your keyboard layout and remove all others

## TODO

Make preparing RPi in only one step
