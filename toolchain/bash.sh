try ./configure --prefix=/tools --without-bash-malloc
try make
try make install
try ln -sv bash /tools/bin/sh