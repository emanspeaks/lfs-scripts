pushd gettext-tools
try EMACS="no" ./configure --prefix=/tools --disable-shared
try make -C gnulib-lib
try make -C intl pluralx.c
try make -C src msgfmt
try make -C src msgmerge
try make -C src xgettext
try cp -v src/{msgfmt,msgmerge,xgettext} /tools/bin
popd