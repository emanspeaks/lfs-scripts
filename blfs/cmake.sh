try ./bootstrap --prefix=/usr       \
            --system-libs       \
            --mandir=/share/man \
            --docdir=/share/doc/cmake-3.1.3 
try make
try make install