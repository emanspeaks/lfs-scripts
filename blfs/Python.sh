CXX="/usr/bin/g++"              \
./configure --prefix=/usr       \
						--enable-shared     \
            --with-system-expat \
            --with-system-ffi   \
            --without-ensurepip \
						--with-dbmliborder=bdb:gdbm:ndbm 
try make
try make install
try chmod -v 755 /usr/lib/libpython3.4m.so
try chmod -v 755 /usr/lib/libpython3.so