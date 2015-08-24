try ./configure --prefix=/usr
try make
try make check
sed -i '/^install-here/ s/install-static//' Makefile
try make install
try chmod -v 755 /usr/lib/libhogweed.so.2.5 /usr/lib/libnettle.so.4.7
try install -v -m755 -d /usr/share/doc/nettle-2.7.1
try install -v -m644 nettle.html /usr/share/doc/nettle-2.7.1