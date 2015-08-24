sed -i -e '/^docdir/     s:$:/libjpeg-turbo-1.4.0:' \
       -e '/^exampledir/ s:$:/libjpeg-turbo-1.4.0:' Makefile.in
try ./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --with-jpeg8            \
            --disable-static
try make
try make test
try make install