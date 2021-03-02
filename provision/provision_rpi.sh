#!/bin/bash

# turn on FAKE KMS by rasp-config in RPi4

echo "pi ALL=NOPASSWD:/usr/bin/rsync" | sudo tee -a /etc/sudoers.d/010_pi-nopasswd
sudo sed -e '/deb-src/ s/^#//' -i /etc/apt/sources.list
sudo apt update
sudo apt -y full-upgrade
# sudo reboot

# below line can be replaced with some mesa and gls related packages (see below) - qt-packages not neccesarry
sudo apt-get -y build-dep qt5-qmake libqt5gui5 libqt5webengine-data libqt5webkit5
sudo apt -y install libudev-dev libinput-dev libts-dev libxcb-xinerama0-dev libxcb-xinerama0 gdbserver

sudo mkdir /usr/local/qt5.15
sudo chown -R pi:pi /usr/local/qt5.15
# sudo raspi-config nonint do_boot_behaviour B1

  # autoconf automake autopoint autotools-dev bison ca-certificates-java
  # chrpath closure-compiler cmake cmake-data debhelper default-jre-headless
  # default-libmysqlclient-dev dh-autoreconf dh-exec dh-strip-nondeterminism
  # dwz firebird-dev firebird3.0-common firebird3.0-common-doc flex
  # freetds-common freetds-dev gettext gir1.2-atk-1.0 gir1.2-atspi-2.0
  # gir1.2-freedesktop gir1.2-gdkpixbuf-2.0 gir1.2-glib-2.0
  # gir1.2-gst-plugins-base-1.0 gir1.2-gstreamer-1.0 gir1.2-gtk-3.0
  # gir1.2-harfbuzz-0.0 gir1.2-pango-1.0 gperf icu-devtools intltool-debian
  # java-common java-wrappers khronos-api libandroid-json-org-java libaom0
  # libarchive-zip-perl libarchive13 libargs4j-java libasound2-dev
  # libasyncns0 libatinject-jsr330-api-java libatk-bridge2.0-dev
  # libatk1.0-dev libatspi2.0-dev libavcodec-dev libavcodec58 libavformat-dev
  # libavformat58 libavutil-dev libavutil56 libbison-dev libbluray2
  # libbrotli-dev libbrotli1 libcairo-script-interpreter2 libcairo2-dev
  # libcap-dev libchromaprint1 libclang1-7 libclosure-compiler-java
  # libcodec2-0.8.1 libct4 libcups2-dev libcupsimage2-dev libdbus-1-dev
  # libdebhelper-perl libdouble-conversion-dev libdouble-conversion1
  # libdrm-dev libdrm-etnaviv1 libdrm-exynos1 libdrm-freedreno1 libdrm-omap1
  # libdrm-tegra0 libegl-dev libegl1-mesa-dev libepoxy-dev
  # libevent-core-2.1-6 libevent-dev libevent-extra-2.1-6
  # libevent-openssl-2.1-6 libevent-pthreads-2.1-6 libexpat1-dev libfbclient2
  # libfile-stripnondeterminism-perl libflac-dev libflac8 libfontconfig1-dev
  # libfribidi-dev libgbm-dev libgdk-pixbuf2.0-dev libgirepository-1.0-1
  # libgl-dev libgl1-mesa-dev libgles-dev libgles1 libgles2 libgles2-mesa-dev
  # libglu1-mesa-dev libglx-dev libgme0 libgmp-dev libgmpxx4ldbl
  # libgnutls-dane0 libgnutls-openssl27 libgnutls28-dev libgnutlsxx28
  # libgraphite2-dev libgsm1 libgstreamer-gl1.0-0
  # libgstreamer-plugins-base1.0-0 libgstreamer-plugins-base1.0-dev
  # libgstreamer1.0-0 libgstreamer1.0-dev libgtk-3-dev libguava-java
  # libharfbuzz-dev libharfbuzz-gobject0 libharfbuzz-icu0 libhyphen-dev
  # libhyphen0 libib-util libice-dev libicu-dev libidn2-dev libjargs-java
  # libjbig-dev libjpeg-dev libjpeg62-turbo-dev libjsoncpp-dev libjsoncpp1
  # libjsr305-java liblcms2-dev libllvm7 libltdl-dev libltdl7 liblzma-dev
  # liblzo2-2 libmariadb-dev libmariadb-dev-compat libminizip-dev libminizip1
  # libmp3lame0 libmpg123-0 libnspr4-dev libnss3-dev libodbc1 libogg-dev
  # libogg0 libopenmpt0 libopus-dev libopus0 liborc-0.4-0 liborc-0.4-dev
  # liborc-0.4-dev-bin libp11-kit-dev libpango1.0-dev libpci-dev
  # libpcre2-16-0 libpcre2-32-0 libpcre2-dev libpixman-1-dev libpq-dev libpq5
  # libprotobuf-dev libprotobuf-lite17 libprotobuf17 libprotoc17 libproxy-dev
  # libpulse-dev libpulse-mainloop-glib0 libpulse0 libqt5concurrent5
  # libqt5core5a libqt5dbus5 libqt5designer5 libqt5designercomponents5
  # libqt5gui5 libqt5help5 libqt5location5 libqt5network5 libqt5opengl5
  # libqt5opengl5-dev libqt5positioning5 libqt5positioning5-plugins
  # libqt5positioningquick5 libqt5printsupport5 libqt5qml5 libqt5quick5
  # libqt5quickcontrols2-5 libqt5quickparticles5 libqt5quicktemplates2-5
  # libqt5quicktest5 libqt5quickwidgets5 libqt5sensors5 libqt5sensors5-dev
  # libqt5sql5 libqt5sql5-sqlite libqt5test5 libqt5webchannel5
  # libqt5webchannel5-dev libqt5webkit5 libqt5widgets5 libqt5xml5 libre2-5
  # libre2-dev librhash0 libruby2.5 libshine3 libsigsegv2 libsm-dev
  # libsnappy-dev libsnappy1v5 libsndfile1 libsoxr0 libspeex1 libsqlite3-dev
  # libssh-gcrypt-4 libssl-dev libswresample-dev libswresample3 libsybdb5
  # libtasn1-6-dev libtheora0 libtiff-dev libtiffxx5 libtommath1 libtool
  # libtwolame0 libunbound8 libusb-1.0-0-dev libuv1 libva-drm2 libva-x11-2
  # libva2 libvdpau1 libvorbis0a libvorbisenc2 libvorbisfile3 libvpx-dev
  # libvpx5 libvulkan-dev libvulkan1 libwavpack1 libwayland-bin
  # libwayland-dev libwebp-dev libwebpdemux2 libwebpmux3 libwoff-dev libwoff1
  # libx11-dev libx11-xcb-dev libx264-155 libx265-165 libxcb-icccm4
  # libxcb-icccm4-dev libxcb-image0-dev libxcb-keysyms1 libxcb-keysyms1-dev
  # libxcb-randr0 libxcb-randr0-dev libxcb-render-util0
  # libxcb-render-util0-dev libxcb-render0-dev libxcb-shape0-dev
  # libxcb-shm0-dev libxcb-sync-dev libxcb-xfixes0-dev libxcb-xkb-dev
  # libxcb-xkb1 libxcomposite-dev libxcursor-dev libxdamage-dev libxext-dev
  # libxfixes-dev libxft-dev libxi-dev libxinerama-dev libxkbcommon-dev
  # libxkbcommon-x11-0 libxkbcommon-x11-dev libxml2-dev libxnvctrl-dev
  # libxnvctrl0 libxrandr-dev libxrender-dev libxslt1-dev libxslt1.1
  # libxss-dev libxtst-dev libxvidcore4 libyaml-0-2 libzvbi-common libzvbi0
  # m4 mesa-common-dev nettle-dev ninja-build odbcinst odbcinst1debian2
  # openjdk-11-jre-headless pango1.0-tools pkg-kde-tools pngcrush po-debconf
  # protobuf-compiler qdoc-qt5 qt5-assistant qt5-qmake qt5-qmake-bin
  # qt5-qmltooling-plugins qtbase5-dev qtbase5-dev-tools qtbase5-doc-html
  # qtbase5-private-dev qtchooser qtdeclarative5-dev qtdeclarative5-dev-tools
  # qtdeclarative5-private-dev qtpositioning5-dev qtquickcontrols2-5-dev
  # qttools5-dev qttools5-dev-tools rake re2c ruby ruby-did-you-mean
  # ruby-minitest ruby-net-telnet ruby-power-assert ruby-test-unit
  # ruby-xmlrpc ruby2.5 rubygems-integration unixodbc-dev wayland-protocols
  # x11proto-composite-dev x11proto-damage-dev x11proto-fixes-dev
  # x11proto-input-dev x11proto-randr-dev x11proto-record-dev
  # x11proto-scrnsaver-dev x11proto-xext-dev x11proto-xinerama-dev xtrans-dev
  # xvfb yui-compressor
