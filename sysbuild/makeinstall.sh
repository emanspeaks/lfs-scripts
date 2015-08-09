try make DESTDIR=/usr/pkg/$pkgname/$tardir install
pkgpath=/usr/pkg/$pkgname
pushd $pkgpath
try ln -svf $tardir ver
cd ver
find * -type d -exec mkdir -pv /{} \;
find * -type f -exec ln -svf $pkgpath/ver/{} /{} \;
popd