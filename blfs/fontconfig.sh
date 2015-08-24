try source $lfsroot/blfs/genericcheck.sh

try install -v -dm755 \
        /usr/share/{man/man{3,5},doc/fontconfig-2.11.1/fontconfig-devel}
try install -v -m644 fc-*/*.1          /usr/share/man/man1 
try install -v -m644 doc/*.3           /usr/share/man/man3 
try install -v -m644 doc/fonts-conf.5  /usr/share/man/man5 
try install -v -m644 doc/fontconfig-devel/* \
        /usr/share/doc/fontconfig-2.11.1/fontconfig-devel
try install -v -m644 doc/*.{pdf,sgml,txt,html} \
       /usr/share/doc/fontconfig-2.11.1
			 
try fc-cache -v /usr/share/ghostscript/fonts/