try ./configure --prefix=/usr
try make
try patch -Np1 -i ../libassuan-2.2.0-fix_doc_build-1.patch
try make -C doc pdf ps
try make check
try make install
try install -v -dm755 /usr/share/doc/libassuan-2.2.0
try install -v -m644  doc/assuan.{pdf,ps,dvi} \
                  /usr/share/doc/libassuan-2.2.0
