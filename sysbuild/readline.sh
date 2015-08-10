try patch -Np1 -i ../readline-6.3-upstream_fixes-3.patch
sed -i '/MV.*old/d' Makefile.in
sed -i '/{OLDSUFF}/c:' support/shlib-install
try ./configure --prefix=/usr --docdir=/usr/share/doc/readline-6.3
try make SHLIB_LIBS=-lncurses
try make SHLIB_LIBS=-lncurses install
try mv -v /usr/lib/lib{readline,history}.so.* /lib
try ln -sfv ../../lib/$(readlink /usr/lib/libreadline.so) /usr/lib/libreadline.so
try ln -sfv ../../lib/$(readlink /usr/lib/libhistory.so ) /usr/lib/libhistory.so
try install -v -m644 doc/*.{ps,pdf,html,dvi} /usr/share/doc/readline-6.3
