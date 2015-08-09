try make mrproper
pkgpath=/usr/pkg/linuxapi
try make INSTALL_HDR_PATH=$pkgpath/3.19 headers_install
find $pkgpath/3.19/include \( -name .install -o -name ..install.cmd \) -delete
#try ln -sv $pkgpath/3.19 $pkgpath/ver
#pushd $pkgpath/ver/include
#find * -type d -exec mkdir -pv /usr/include/{} \;
#find * -type f -exec ln -svf $pkgpath/ver/include/{} /usr/include/{} \;
#popd

pushd $pkgpath
try ln -svf 3.19 ver
cd ver/include
find * -type d -exec mkdir -pv /usr/include/{} \; 
#-exec ln -svf {}/* /usr/include/{} \;
find * -type f -exec ln -svf $pkgpath/ver/{} /usr/include/{} \;
popd