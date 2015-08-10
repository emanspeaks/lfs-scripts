try ./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.15
try make
sed -i "s:./configure:LEXLIB=/usr/lib/libfl.a &:" t/lex-{clean,depend}-cxx.sh
try make -j4 check
try make install