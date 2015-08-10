try patch -Np1 -i ../bzip2-1.0.6-install_docs-1.patch
sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile
sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile
try make -f Makefile-libbz2_so
try make clean
try make
try make PREFIX=/usr install
try cp -v bzip2-shared /bin/bzip2
try cp -av libbz2.so* /lib
try ln -sv ../../lib/libbz2.so.1.0 /usr/lib/libbz2.so
try rm -v /usr/bin/{bunzip2,bzcat,bzip2}
try ln -sv bzip2 /bin/bunzip2
try ln -sv bzip2 /bin/bzcat
