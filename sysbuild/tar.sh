try FORCE_UNSAFE_CONFIGURE=1  \
./configure --prefix=/usr \
            --bindir=/bin
try make
try make check
try make install
try make -C doc install-html docdir=/usr/share/doc/tar-1.28