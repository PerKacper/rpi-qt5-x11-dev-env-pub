@echo off
pushd source\
curl -L -O https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabihf/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf.tar.xz
curl -L -O https://download.qt.io/archive/qt/5.15/5.15.0/single/qt-everywhere-src-5.15.0.tar.xz
REM curl https://downloads.raspberrypi.org/raspios_full_armhf_latest
curl -L -O https://downloads.raspberrypi.org/raspios_full_armhf/images/raspios_full_armhf-2021-01-12/2021-01-11-raspios-buster-armhf-full.zip
curl -L -O https://raw.githubusercontent.com/riscv/riscv-poky/master/scripts/sysroot-relativelinks.py
popd
