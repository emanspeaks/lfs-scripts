try ./configure --prefix=/usr       \
            --with-apr=/usr     \
            --with-gdbm=/usr    \
            --with-openssl=/usr \
            --with-crypto       \
						--with-berkeley-db=/usr
try make
try make test
try make install