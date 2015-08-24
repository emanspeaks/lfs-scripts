try ./configure --prefix=/usr --disable-static 
try make
try doxygen Doxyfile
try make verify
try make install
try install -v -m755 -d /usr/share/doc/libevent-2.0.22/api 
try cp      -v -R       doxygen/html/* \
                    /usr/share/doc/libevent-2.0.22/api