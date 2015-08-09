try ./configure --prefix=/usr
try make
try make check
try make DESTDIR=/usr/pkg/$pkgname/$tardir install
try ln -s /usr/pkg/$pkgname/$tardir /usr/pkg/$pkgname/ver
try find * -type d -exec mkdir -pv /{} \;
try find * -type f -exec ln -svf /usr/pkg/$pkgname/ver/{} /{} \;