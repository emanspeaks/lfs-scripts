sed -i 's#$(LOBJS): Makefile#$(LOBJS): pth_p.h Makefile#' Makefile.in
try ./configure --prefix=/usr           \
            --disable-static        \
            --mandir=/usr/share/man 
try make
try make test
try make install
try install -v -m755 -d /usr/share/doc/pth-2.0.7
try install -v -m644    README PORTING SUPPORT TESTS \
                    /usr/share/doc/pth-2.0.7
