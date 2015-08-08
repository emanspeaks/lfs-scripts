try mkdir -v ../binutils-build2
pushd ../binutils-build2
try CC=$LFS_TGT-gcc                \
AR=$LFS_TGT-ar                 \
RANLIB=$LFS_TGT-ranlib         \
../binutils-2.25/configure     \
    --prefix=/tools            \
    --disable-nls              \
    --disable-werror           \
    --with-lib-path=/tools/lib \
    --with-sysroot
try make
try make install
try make -C ld clean
try make -C ld LIB_PATH=/usr/lib:/lib
try cp -v ld/ld-new /tools/bin
popd
try rm -vrf ../binutils-build2