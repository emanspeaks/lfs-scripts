try ./configure --prefix=/usr --disable-static 
try make
try doxygen
try make install
try install -v -m755 -d /usr/share/doc/popt-1.16 
try install -v -m644 doxygen/html/* /usr/share/doc/popt-1.16