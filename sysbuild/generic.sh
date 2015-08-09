try ./configure --prefix=/usr
try make
try make check
try make DESTDIR=/usr/pkg/$pkgname/$tardir install
try ln -svf /usr/pkg/$pkgname/$tardir /usr/pkg/$pkgname/ver
find * -type d -exec mkdir -pv /{} \;
find * -type f -exec ln -svf /usr/pkg/$pkgname/ver/{} /{} \;