gzip -cd ../libpng-1.6.16-apng.patch.gz | patch -p1
try source $lfsroot/blfs/genericcheck.sh
try mkdir -v /usr/share/doc/libpng-1.6.16 &&
try cp -v README libpng-manual.txt /usr/share/doc/libpng-1.6.16