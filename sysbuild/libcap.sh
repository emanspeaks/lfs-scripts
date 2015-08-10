try make
try make RAISE_SETFCAP=no prefix=/usr install
try chmod -v 755 /usr/lib/libcap.so
try mv -v /usr/lib/libcap.so.* /lib
try ln -sfv ../../lib/$(readlink /usr/lib/libcap.so) /usr/lib/libcap.so