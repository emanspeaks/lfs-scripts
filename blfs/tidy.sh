try source $lfsroot/blfs/generic.sh
try install -v -m644 -D htmldoc/tidy.1 \
                    /usr/share/man/man1/tidy.1 
try install -v -m755 -d /usr/share/doc/tidy-cvs_20101110 
try install -v -m644    htmldoc/*.{html,gif,css} \
                    /usr/share/doc/tidy-cvs_20101110
cd htmldoc/
try doxygen
try cp -rv htmldoc/api /usr/share/doc/tidy-cvs_20101110
cd ..