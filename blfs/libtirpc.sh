try source $lfsroot/blfs/generic.sh
try mv -v /usr/lib/libtirpc.so.* /lib 
try ln -sfv ../../lib/libtirpc.so.1.0.10 /usr/lib/libtirpc.so