try ./configure --prefix /usr --with-doxysearch \
            --docdir /usr/share/doc/doxygen-1.8.9.1 
try make
try make MAN1DIR=share/man/man1 install
try make install_docs