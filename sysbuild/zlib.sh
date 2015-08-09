try ./configure --prefix=/usr
try make
try make check
try make install
try mv -v /usr/lib/libz.so.* /lib
try ln -sfv ../../lib/$(readlink /usr/lib/libz.so) /usr/lib/libz.so