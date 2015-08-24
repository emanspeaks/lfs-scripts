try ./configure --prefix=/usr --with-capabilities
try make
try make -j1 -C doc html
try makeinfo --html --no-split -o doc/gcrypt_nochunks.html doc/gcrypt.texi
try makeinfo --plaintext       -o doc/gcrypt.txt           doc/gcrypt.texi
try make check
try make install
try install -v -dm755   /usr/share/doc/libgcrypt-1.6.2
try install -v -m644    README doc/{README.apichanges,fips*,libgcrypt*} \
                    /usr/share/doc/libgcrypt-1.6.2
try install -v -dm755   /usr/share/doc/libgcrypt-1.6.2/html
try install -v -m644 doc/gcrypt.html/* \
                    /usr/share/doc/libgcrypt-1.6.2/html
try install -v -m644 doc/gcrypt_nochunks.html \
                    /usr/share/doc/libgcrypt-1.6.2
try install -v -m644 doc/gcrypt.{txt,texi} \
                    /usr/share/doc/libgcrypt-1.6.2