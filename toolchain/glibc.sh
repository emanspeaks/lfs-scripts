if [ ! -r /usr/include/rpc/types.h ]; then
  su -c '"mkdir -pv /usr/include/rpc"'
  su -c '"cp -v sunrpc/rpc/*.h /usr/include/rpc"'
fi
sed -e '/ia32/s/^/1:/' \
    -e '/SSE2/s/^1://' \
    -i  sysdeps/i386/i686/multiarch/mempcpy_chk.S
try mkdir -v ../glibc-build
pushd ../glibc-build

try ../glibc-2.21/configure                             \
      --prefix=/tools                               \
      --host=$LFS_TGT                               \
      --build=$(../glibc-2.21/scripts/config.guess) \
      --disable-profile                             \
      --enable-kernel=2.6.32                        \
      --with-headers=/tools/include                 \
      libc_cv_forced_unwind=yes                     \
      libc_cv_ctors_header=yes                      \
      libc_cv_c_cleanup=yes
try make
try make install
popd
try rm -vrf ../glibc-build