try mkdir -v ../gcc-build
pushd ../gcc-build

try SED=sed                       \
../gcc-4.9.2/configure        \
     --prefix=/usr            \
     --enable-languages=c,c++ \
     --disable-multilib       \
     --disable-bootstrap      \
     --with-system-zlib
try make
try ulimit -s 32768
try make -k check
../gcc-4.9.2/contrib/test_summary | grep -A7 Summ
try source $makeinstall
try ln -sv ../usr/bin/cpp /lib
try ln -sv gcc /usr/bin/cc
try install -v -dm755 /usr/lib/bfd-plugins
try ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/4.9.2/liblto_plugin.so /usr/lib/bfd-plugins/
try mkdir -pv /usr/share/gdb/auto-load/usr/lib
try mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib

popd
try rm -vrf ../gcc-build