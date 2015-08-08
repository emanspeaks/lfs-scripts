#!/bin/bash
#this script assumes you are running as user lfs:lfs.

if [ -z $includedalready ]
then
	pushd `dirname $0` > /dev/null; mypath=`pwd`; popd > /dev/null
	lfsroot=$mypath #unique to main.sh since it's top-level
	logpath=$lfsroot/logs
  source $lfsroot/include/include.sh
fi

toolchain=$lfsroot/toolchain
wrap=$lfsroot/include/wrapper.sh

if [ -z $1 ]
then
	try source $lfsroot/prep/download.sh
fi

pushd $toolchain
case $1 in
	1) ptry $wrap binutils-2.25.tar.bz2 binutils1.sh ;&
	
	2)
	  pushd $LFS/sources
		setlogname mpfr
		try tar -xvf $LFS/sources/mpfr-3.1.2.tar.xz
		setlogname gmp
		try tar -xvf $LFS/sources/gmp-6.0.0a.tar.xz 
		setlogname mpc
		try tar -xvf $LFS/sources/mpc-1.0.2.tar.gz
		setlogname $myname
		popd
		;&
		
	3) ptry $wrap gcc-4.9.2.tar.bz2 gcc1.sh ;&
	4) ptry $wrap linux-3.19.tar.xz linuxapi.sh ;&
	5) ptry $wrap glibc-2.21.tar.xz glibc.sh ;&

	6)
		pushd $LFS/sources
		echo 'main(){}' > dummy.c
		try $LFS_TGT-gcc dummy.c
		echo `readelf -l a.out | grep ': /tools' | cut -d: -f2`
		try rm -v dummy.c a.out
		popd
		;&

	#genlist=()
esac

popd