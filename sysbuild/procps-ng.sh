try ./configure --prefix=/usr                           \
            --exec-prefix=                          \
            --libdir=/usr/lib                       \
            --docdir=/usr/share/doc/procps-ng-3.3.10 \
            --disable-static                        \
            --disable-kill
try make
sed -i -r 's|(pmap_initname)\\\$|\1|' testsuite/pmap.test/pmap.exp
try make check
try make install
try mv -v /usr/bin/pidof /bin
try mv -v /usr/lib/libprocps.so.* /lib
try ln -sfv ../../lib/$(readlink /usr/lib/libprocps.so) /usr/lib/libprocps.so
