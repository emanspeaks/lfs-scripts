#!/bin/bash
#this script assumes you are CHROOTED and running as user ROOT

if [ -z $includedalready ]
then
	pushd `dirname $0` > /dev/null; mypath=`pwd`; popd > /dev/null
	lfsroot=$mypath #unique to main4.sh since it's top-level
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
	1|gcc2) ptry source gcc2.sh ;&
	
	2)
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
	
	3) ptry $wrap bzip2-1.0.6.tar.gz bzip2.sh ;&
	4) ptry $wrap pkg-config-0.28.tar.gz generic.sh  \
						--with-internal-glib  \
            --disable-host-tool   \
            --docdir=/usr/share/doc/pkg-config-0.28 ;&
	5) ptry $wrap ncurses-5.9.tar.gz ncurses.sh ;&
	6) ptry $wrap attr-2.4.47.src.tar.gz attr.sh ;&
	7) ptry $wrap acl-2.2.52.src.tar.gz acl.sh ;&
	8) ptry $wrap libcap-2.24.tar.xz libcap.sh ;&
	9) ptry $wrap sed-4.2.2.tar.bz2 sed.sh ;&
	10) ptry $wrap psmisc-22.21.tar.gz psmisc.sh ;&
	11) ptry $wrap procps-ng-3.3.10.tar.xz procps-ng.sh ;&
	12) ptry $wrap e2fsprogs-1.42.12.tar.gz e2fsprogs.sh ;&
	13) ptry $wrap coreutils-8.23.tar.xz coreutils.sh ;&
	14) ptry $wrap iana-etc-2.30.tar.bz2 iana-etc.sh ;&
	15) ptry $wrap m4-1.4.17.tar.xz generic.sh ;&
	16) ptry $wrap flex-2.5.39.tar.bz2 flex.sh \
		--docdir=/usr/share/doc/flex-2.5.39 ;&
	17) ptry $wrap bison-3.0.4.tar.xz generic.sh \
		--docdir=/usr/share/doc/bison-3.0.4 ;&
	18) ptry $wrap grep-2.21.tar.xz grep.sh --bindir=/bin ;&
	19) ptry $wrap readline-6.3.tar.gz readline.sh ;&
	
	20) 
		ptry $wrap bash-4.3.30.tar.gz bash.sh 
		echo "RUN"
		echo '"exec /bin/bash --login +h"'
		echo "TO USE NEW BASH"
		pressanykey
		;&
	
	*) pressanykey; startpt= ;;
esac
popd