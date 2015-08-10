setlogname gcc

pushd /sources
try tar -xvf gcc-4.9.2.tar.bz2
cd gcc-4.9.2

try mkdir -v ../gcc-build
pushd ../gcc-build

try SED=sed                       \
../gcc-4.9.2/configure        \
     --prefix=/usr            \
     --enable-languages=c,c++ \
     --disable-multilib       \
     --disable-bootstrap      \
     --with-system-zlib
try make
try ulimit -s 32768
try make -k check

popd
