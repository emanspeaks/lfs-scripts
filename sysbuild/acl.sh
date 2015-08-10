sed -i -e 's|/@pkg_name@|&-@pkg_version@|' include/builddefs.in
sed -i "s:| sed.*::g" test/{sbits-restore,cp,misc}.test
sed -i -e "/TABS-1;/a if (x > (TABS-1)) x = (TABS-1);" \
    libacl/__acl_to_any_text.c
try ./configure --prefix=/usr \
            --bindir=/bin \
            --libexecdir=/usr/lib
try make
try make install install-dev install-lib
try chmod -v 755 /usr/lib/libacl.so
try mv -v /usr/lib/libacl.so.* /lib
try ln -sfv ../../lib/$(readlink /usr/lib/libacl.so) /usr/lib/libacl.so