try patch -Np1 -i ../openssl-1.0.2-fix_parallel_build-1.patch
try ./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic 
try make
try make test
sed -i 's# libcrypto.a##;s# libssl.a##' Makefile
try make MANDIR=/usr/share/man MANSUFFIX=ssl install
try install -dv -m755 /usr/share/doc/openssl-1.0.2
try cp -vfr doc/*     /usr/share/doc/openssl-1.0.2