try source $lfsroot/sysbuild/generic.sh
try mv -v   /usr/bin/{lzma,unlzma,lzcat,xz,unxz,xzcat} /bin
try mv -v /usr/lib/liblzma.so.* /lib
try ln -svf ../../lib/$(readlink /usr/lib/liblzma.so) /usr/lib/liblzma.so