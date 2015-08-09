try patch -Np1 -i ../mpfr-3.1.2-upstream_fixes-3.patch
try ./configure --prefix=/usr        \
            --enable-thread-safe \
            --docdir=/usr/share/doc/mpfr-3.1.2
try make
try make html
try make check
try make install
try make install-html