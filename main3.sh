#!/bin/bash
#this script assumes you are CHROOTED and running as user ROOT

if [ -z $includedalready ]
then
	pushd `dirname $0` > /dev/null; mypath=`pwd`; popd > /dev/null
	lfsroot=$mypath #unique to main2.sh since it's top-level
	export lfsstage=sysbuild
	logpath=$lfsroot/logs/$lfsstage
  source $lfsroot/include/include.sh
fi

wrap=$lfsroot/include/wrapper.sh
startpt=$1

if [ -z $startpt ]
then
	startpt=1
fi

pushd $lfsroot/sysbuild
case $startpt in
	1) ptry $wrap linux-3.19.tar.xz linuxapi.sh ;&
	2) ptry $wrap man-pages-3.79.tar.xz manpages.sh ;&
	
	3) 
		ptry source glibc.sh 
		echo "CHECK THE TEST RESULTS, SHOULD ONLY BE 2 FAIL (getaddrinfo)"
		pressanykey
		;&
	
	4) ptry source glibc2.sh ;&
	
	5)
		try mv -v /tools/bin/{ld,ld-old}
		try mv -v /tools/$(gcc -dumpmachine)/bin/{ld,ld-old}
		try mv -v /tools/bin/{ld-new,ld}
		try ln -sv /tools/bin/ld /tools/$(gcc -dumpmachine)/bin/ld
		
		gcc -dumpspecs | sed -e 's@/tools@@g'                   \
			-e '/\*startfile_prefix_spec:/{n;s@.*@/usr/lib/ @}' \
			-e '/\*cpp:/{n;s@$@ -isystem /usr/include@}' >      \
			`dirname $(gcc --print-libgcc-file-name)`/specs
		
		echo 'main(){}' > dummy.c
		cc dummy.c -v -Wl,--verbose &> dummy.log
		readelf -l a.out | grep ': /lib'
		echo "DOES THIS SAY /lib(64)?:" 
		echo `readelf -l a.out | grep ': /tools'`
		pressanykey
		try rm -v dummy.c a.out
		
		echo "DOES THIS SAY crt[1in].*succeeded?:"
		grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log
		pressanykey
		
		echo "DOES THIS SAY #include <...> search starts here: /usr/include?:"
		grep -B1 '^ /usr/include' dummy.log
		pressanykey
		
		echo "DOES THIS SAY SEARCH_DIR("/usr/lib"); SEARCH_DIR("/lib");?:"
		grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'
		pressanykey
		
		echo "DOES THIS SAY attempt to open /lib/libc.so.6 succeeded?:"
		grep "/lib.*/libc.so.6 " dummy.log
		pressanykey
		
		echo "DOES THIS SAY found ld-linux.so.2 at /lib/ld-linux.so.2?:"
		grep found dummy.log
		pressanykey
		try rm -v dummy.log
		;&
	
	6) ptry $wrap zlib-1.2.8.tar.xz zlib.sh ;&
	7) ptry $wrap file-5.22.tar.gz generic.sh ;&
	
	8) 
		echo "DOES THIS SAY spawn ls?:"
		expect -c "spawn ls"
		pressanykey
		ptry $wrap binutils-2.25.tar.bz2 binutils.sh ;&
	
	9) ptry $wrap gmp-6.0.0a.tar.xz gmp.sh ;&
	10) ptry $wrap mpfr-3.1.2.tar.xz mpfr.sh ;&
	11) ptry $wrap mpc-1.0.2.tar.gz mpc.sh ;&
	
	12)
		ptry $wrap gcc-4.9.2.tar.bz2 gcc.sh
		
		echo 'main(){}' > dummy.c
		cc dummy.c -v -Wl,--verbose &> dummy.log
		readelf -l a.out | grep ': /lib'
		
		echo "DOES THIS SAY /lib(64)?:" 
		echo `readelf -l a.out | grep ': /tools'`
		pressanykey
		try rm -v dummy.c a.out
		
		echo "DOES THIS SAY crt[1in].*succeeded?:"
		grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log
		pressanykey
		
		echo "DOES THIS SAY #include <...> search starts here: /usr/{,local/}include?:"
		grep -B4 '^ /usr/include' dummy.log
		pressanykey
		
		echo 'DOES THIS SAY SEARCH_DIR("/usr/{,local/}lib"); SEARCH_DIR("/lib");?:'
		grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'
		pressanykey
		
		echo "DOES THIS SAY attempt to open /lib/libc.so.6 succeeded?:"
		grep "/lib.*/libc.so.6 " dummy.log
		pressanykey
		
		echo "DOES THIS SAY found ld-linux.so.2 at /lib/ld-linux.so.2?:"
		grep found dummy.log
		pressanykey
		try rm -v dummy.log
		;&
	
	*) pressanykey; startpt= ;;
esac
popd