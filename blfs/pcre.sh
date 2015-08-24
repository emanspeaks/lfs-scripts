try source $lfsroot/blfs/genericcheck.sh
try mv -v /usr/lib/libpcre.so.* /lib
try ln -sfv ../../lib/$(readlink /usr/lib/libpcre.so) /usr/lib/libpcre.so