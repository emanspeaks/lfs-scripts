#!/bin/bash
#this script assumes you are CHROOTED and running as user ROOT

if [ -z $includedalready ]
then
	pushd `dirname $0` > /dev/null; mypath=`pwd`; popd > /dev/null
	lfsroot=$mypath #unique to main5.sh since it's top-level
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
	1) ptry $wrap bc-1.06.95.tar.bz2 bc.sh ;&
	2) ptry $wrap libtool-2.4.6.tar.xz libtool.sh ;&
	3) ptry $wrap gdbm-1.11.tar.gz generic.sh --enable-libgdbm-compat ;&
	4) ptry $wrap expat-2.1.0.tar.gz expat.sh ;&
	5) ptry $wrap inetutils-1.9.2.tar.gz inetutils.sh \
						--localstatedir=/var   \
            --disable-logger       \
            --disable-whois        \
            --disable-servers ;&
	6) ptry $wrap perl-5.20.2.tar.bz2 perl.sh ;&
	7) ptry $wrap XML-Parser-2.44.tar.gz xmlparser.sh ;&
	8) ptry $wrap autoconf-2.69.tar.xz autoconf.sh ;&
	9) ptry $wrap automake-1.15.tar.xz automake.sh ;&
	10) ptry $wrap diffutils-3.3.tar.xz diffutils.sh ;&
	
	*) pressanykey; startpt= ;;
esac
popd