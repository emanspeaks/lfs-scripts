sed -r -i 's|/usr(/bin/test)|\1|' test/udev-test.pl
try BLKID_CFLAGS=-I/tools/include       \
BLKID_LIBS='-L/tools/lib -lblkid'   \
./configure --prefix=/usr           \
            --bindir=/sbin          \
            --sbindir=/sbin         \
            --libdir=/usr/lib       \
            --sysconfdir=/etc       \
            --libexecdir=/lib       \
            --with-rootprefix=      \
            --with-rootlibdir=/lib  \
            --enable-split-usr      \
            --enable-libkmod        \
            --enable-rule_generator \
            --enable-keymap         \
            --disable-introspection \
            --disable-gudev         \
            --disable-gtk-doc-html
try make
try mkdir -pv /lib/udev/rules.d
try mkdir -pv /etc/udev/rules.d
try make check
try make install
try tar -xvf ../eudev-2.1.1-manpages.tar.bz2 -C /usr/share
try tar -xvf ../udev-lfs-20140408.tar.bz2
try make -f udev-lfs-20140408/Makefile.lfs install
try udevadm hwdb --update