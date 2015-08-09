try make mrproper
pkgpath=/usr/pkg/linuxapi/3.19
try make INSTALL_HDR_PATH=$pkgpath headers_install
find $pkgpath/include \( -name .install -o -name ..install.cmd \) -delete
try ln -svf $pkgpath/3.19 $pkgpath/ver
pushd $pkgpath/ver/include
find * -type d -exec mkdir -pv /usr/include/{} \;
find * -type f -exec ln -svf $pkgpath/ver/include/{} /usr/include/{} \;
popd