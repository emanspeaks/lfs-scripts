try ./configure --prefix=/usr --bindir=/bin --htmldir=/usr/share/doc/sed-4.2.2
try make
try make html
try make check
try make install
try make -C doc install-html
