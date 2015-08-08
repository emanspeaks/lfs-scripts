pushd unix
source $lfsroot/toolchain/generic.sh
try chmod -v u+w /tools/lib/libtcl8.6.so
try make install-private-headers
try ln -sv tclsh8.6 /tools/bin/tclsh
popd