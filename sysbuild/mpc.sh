try ./configure --prefix=/usr --docdir=/usr/share/doc/mpc-1.0.2
try make
try make html
try make check
try source $makeinstall
try make install-html