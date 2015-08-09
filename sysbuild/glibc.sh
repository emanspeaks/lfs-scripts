#!/bin/bash

if [ -z $includedalready ]
then
	pushd `dirname $0` > /dev/null; mypath=`pwd`; popd > /dev/null
	lfsroot=$mypath/..
	export lfsstage=sysbuild
	logpath=$lfsroot/logs/$lfsstage
  source $lfsroot/include/include.sh
fi

setlogname glibc

pushd /sources
try tar -xvf glibc-2.21.tar.xz
cd glibc-2.21

try patch -Np1 -i ../glibc-2.21-fhs-1.patch
sed -e '/ia32/s/^/1:/' \
    -e '/SSE2/s/^1://' \
    -i  sysdeps/i386/i686/multiarch/mempcpy_chk.S
try mkdir -v ../glibc-build
cd ../glibc-build

try ../glibc-2.21/configure    \
    --prefix=/usr          \
    --disable-profile      \
    --enable-kernel=2.6.32 \
    --enable-obsolete-rpc
try make
try make check

#cd ..
#try rm -rvf glibc-2.21
#setlogname $myname
popd