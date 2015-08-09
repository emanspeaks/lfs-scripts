try mkdir -v ../binutils-build
pushd ../binutils-build

try ../binutils-2.25/configure --prefix=/usr   \
                           --enable-shared \
                           --disable-werror
try make tooldir=/usr
try make -k check
try make tooldir=/usr install

popd
try rm -vrf ../binutils-build