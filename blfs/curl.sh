try source $lfsroot/blfs/generic.sh
find docs \( -name Makefile\* -o -name \*.1 -o -name \*.3 \) -exec rm {} \;
try install -v -d -m755 /usr/share/doc/curl-7.40.0 
try cp -v -R docs/*     /usr/share/doc/curl-7.40.0