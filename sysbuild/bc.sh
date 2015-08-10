try patch -Np1 -i ../bc-1.06.95-memory_leak-1.patch
try ./configure --prefix=/usr           \
            --with-readline         \
            --mandir=/usr/share/man \
            --infodir=/usr/share/info
try make
echo "quit" | ./bc/bc -l Test/checklib.b
try make install