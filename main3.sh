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
	
	4|glibc2) ptry source glibc2.sh ;&
	
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
		ptry $wrap binutils-2.25.tar.bz2 binutils.sh 
		;&
	
	9) ptry $wrap gmp-6.0.0a.tar.xz gmp.sh ;&
	10) ptry $wrap mpfr-3.1.2.tar.xz mpfr.sh ;&
	11) ptry $wrap mpc-1.0.2.tar.gz mpc.sh ;&
	
	12) ptry source gcc.sh ;&
	
	13|gccresults)
		/sources/gcc-4.9.2/contrib/test_summary | grep -A7 Summ
		echo "CHECK THE TEST RESULTS"
		pressanykey
		;&
	
	14|gcc2) ptry source gcc2.sh ;&
	
	15)
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
	
	16) ptry $wrap bzip2-1.0.6.tar.gz bzip2.sh ;&
	17) ptry $wrap pkg-config-0.28.tar.gz generic.sh  \
						--with-internal-glib  \
            --disable-host-tool   \
            --docdir=/usr/share/doc/pkg-config-0.28 ;&
	18) ptry $wrap ncurses-5.9.tar.gz ncurses.sh ;&
	19) ptry $wrap attr-2.4.47.src.tar.gz attr.sh ;&
	20) ptry $wrap acl-2.2.52.src.tar.gz acl.sh ;&
	21) ptry $wrap libcap-2.24.tar.xz libcap.sh ;&
	22) ptry $wrap sed-4.2.2.tar.bz2 sed.sh ;&
	23) ptry $wrap psmisc-22.21.tar.gz psmisc.sh ;&
	24) ptry $wrap procps-ng-3.3.10.tar.xz procps-ng.sh ;&
	25) ptry $wrap e2fsprogs-1.42.12.tar.gz e2fsprogs.sh ;&
	26) ptry $wrap coreutils-8.23.tar.xz coreutils.sh ;&
	
	*) pressanykey; startpt= ;;
esac
popd