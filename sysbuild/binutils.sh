try mkdir -v ../binutils-build
pushd ../binutils-build

try ../binutils-2.25/configure --prefix=/usr   \
                           --enable-shared \
                           --disable-werror
try make tooldir=/usr
try make -k check
try make DESTDIR=/usr/pkg/$pkgname/$tardir tooldir=/usr install
pkgpath=/usr/pkg/$pkgname
try ln -svf $pkgpath/$tardir $pkgpath/ver
pushd $pkgpath/ver
find * -type d -exec mkdir -pv /{} \;
find * -type f -exec ln -svf $pkgpath/ver/{} /{} \;
popd

popd
try rm -vrf ../binutils-build