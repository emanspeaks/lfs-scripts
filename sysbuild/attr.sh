sed -i -e 's|/@pkg_name@|&-@pkg_version@|' include/builddefs.in
try ./configure --prefix=/usr --bindir=/bin
try make
try make -j1 tests root-tests
try make install install-dev install-lib
try chmod -v 755 /usr/lib/libattr.so
try mv -v /usr/lib/libattr.so.* /lib
try ln -sfv ../../lib/$(readlink /usr/lib/libattr.so) /usr/lib/libattr.so