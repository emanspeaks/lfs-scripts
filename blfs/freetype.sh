try tar -xf ../freetype-doc-2.5.5.tar.bz2 --strip-components=2 -C docs
sed -i  -e "/AUX.*.gxvalid/s@^# @@" \
        -e "/AUX.*.otvalid/s@^# @@" \
        modules.cfg                        &&
sed -ri -e 's:.*(#.*SUBPIXEL.*) .*:\1:' \
        include/config/ftoption.h
try source $lfsroot/blfs/generic.sh
try install -v -m755 -d /usr/share/doc/freetype-2.5.5
try cp -v -R docs/*     /usr/share/doc/freetype-2.5.5