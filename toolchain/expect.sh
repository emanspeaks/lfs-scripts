try cp -v configure{,.orig}
sed 's:/usr/local/bin:/bin:' configure.orig > configure
try ./configure --prefix=/tools       \
            --with-tcl=/tools/lib \
            --with-tclinclude=/tools/include
try make
try make SCRIPTS="" install
