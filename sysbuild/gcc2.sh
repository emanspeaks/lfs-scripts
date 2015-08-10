setlogname gcc2
tardir=gcc-4.9.2
pkgname=gcc

pushd /sources/gcc-build

try make install
try ln -sv ../usr/bin/cpp /lib
try ln -sv gcc /usr/bin/cc
try install -v -dm755 /usr/lib/bfd-plugins
try ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/4.9.2/liblto_plugin.so /usr/lib/bfd-plugins/
try mkdir -pv /usr/share/gdb/auto-load/usr/lib
try mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib

cd ..
try rm -rvf $tardir
try rm -vrf gcc-build
setlogname $myname
popd