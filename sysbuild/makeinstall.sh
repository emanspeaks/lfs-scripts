try make DESTDIR=/usr/pkg/$pkgname/$tardir install
pkgpath=/usr/pkg/$pkgname
try ln -svf $pkgpath/$tardir $pkgpath/ver
pushd $pkgpath/ver
find * -type d -exec mkdir -pv /{} \;
find * -type f -exec ln -svf $pkgpath/ver/{} /{} \;
popd