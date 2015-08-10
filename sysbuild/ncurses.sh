try ./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --with-shared           \
            --without-debug         \
            --enable-pc-files       \
            --enable-widec
try make
try make install
try mv -v /usr/lib/libncursesw.so.5* /lib
try ln -sfv ../../lib/$(readlink /usr/lib/libncursesw.so) /usr/lib/libncursesw.so
for lib in ncurses form panel menu ; do
    try rm -vf                    /usr/lib/lib${lib}.so
    echo "INPUT(-l${lib}w)" > /usr/lib/lib${lib}.so
    try ln -sfv lib${lib}w.a      /usr/lib/lib${lib}.a
    try ln -sfv ${lib}w.pc        /usr/lib/pkgconfig/${lib}.pc
done

try ln -sfv libncurses++w.a /usr/lib/libncurses++.a
try rm -vf                     /usr/lib/libcursesw.so
echo "INPUT(-lncursesw)" > /usr/lib/libcursesw.so
try ln -sfv libncurses.so      /usr/lib/libcurses.so
try ln -sfv libncursesw.a      /usr/lib/libcursesw.a
try ln -sfv libncurses.a       /usr/lib/libcurses.a
try mkdir -v       /usr/share/doc/ncurses-5.9
try cp -v -R doc/* /usr/share/doc/ncurses-5.9