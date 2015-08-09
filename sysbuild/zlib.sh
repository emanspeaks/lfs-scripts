try source $lfsroot/sysbuild/generic.sh
try mv -v /usr/lib/libz.so.* /lib
try ln -sfv ../../lib/$(readlink /usr/lib/libz.so) /usr/lib/libz.so