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
		echo "DOES THIS SAY /tools/lib(64)?:" 
		echo `readelf -l a.out | grep ': /tools'`
		pressanykey
		try rm -v dummy.c a.out
		popd
		;&
	
	7) ptry $wrap gcc-4.9.2.tar.bz2 libstdcxx.sh ;&
	8) ptry $wrap binutils-2.25.tar.bz2 binutils2.sh ;&
	9) ptry $wrap gcc-4.9.2.tar.bz2 gcc2.sh ;&
	
	10)
		pushd $LFS/sources
		echo 'main(){}' > dummy.c
		try cc dummy.c
		echo "DOES THIS SAY /tools/lib(64)?:" 
		echo `readelf -l a.out | grep ': /tools'`
		pressanykey
		try rm -v dummy.c a.out
		popd
		;&
		
	11) ptry $wrap tcl8.6.3-src.tar.gz tcl.sh ;&
	12) ptry $wrap expect5.45.tar.gz expect.sh ;&
	13) ptry $wrap dejagnu-1.5.2.tar.gz dejagnu.sh ;&
	14) ptry $wrap check-0.9.14.tar.gz check.sh ;&
	15) ptry $wrap ncurses-5.9.tar.gz ncurses.sh ;&
	16) ptry $wrap bash-4.3.30.tar.gz bash.sh ;&
	17) ptry $wrap bzip2-1.0.6.tar.gz bzip2.sh ;& 
	17) ptry $wrap coreutils-8.23.tar.xz coreutils.sh ;& 
	18) ptry $wrap diffutils-3.3.tar.xz generic.sh ;&
	19) ptry $wrap file-5.22.tar.gz generic.sh ;&
	20) ptry $wrap findutils-4.4.2.tar.gz generic.sh ;&
	21) ptry $wrap gawk-4.1.1.tar.xz generic.sh ;&
	22) ptry $wrap gettext-0.19.4.tar.xz gettext.sh ;&
	23) ptry $wrap grep-2.21.tar.xz generic.sh ;&
	24) ptry $wrap gzip-1.6.tar.xz generic.sh ;&
	25) ptry $wrap m4-1.4.17.tar.xz generic.sh ;&
	26) ptry $wrap make-4.1.tar.bz2 make.sh ;&
	27) ptry $wrap patch-2.7.4.tar.xz generic.sh ;&
	28) ptry $wrap perl-5.20.2.tar.bz2 perl.sh ;&
	29) ptry $wrap sed-4.2.2.tar.bz2 generic.sh ;&
	30) ptry $wrap tar-1.28.tar.xz generic.sh ;&
	31) ptry $wrap texinfo-5.2.tar.xz generic.sh ;&
	32) ptry $wrap util-linux-2.26.tar.xz util-linux.sh ;&
	33) ptry $wrap xz-5.2.0.tar.xz generic.sh ;&
	
	34)
		try strip --strip-debug /tools/lib/*
		try /usr/bin/strip --strip-unneeded /tools/{,s}bin/*
		try rm -rf /tools/{,share}/{info,man,doc}
		pressanykey
		;&
	
	*) ;;
esac
popd