#!/bin/bash
#this script assumes you are CHROOTED and running as user ROOT

if [ -z $includedalready ]
then
	pushd `dirname $0` > /dev/null; mypath=`pwd`; popd > /dev/null
	lfsroot=$mypath #unique to main2.sh since it's top-level
	logpath=$lfsroot/logs
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
	3) ptry $wrap glibc-2.21.tar.xz glibc.sh ;&
	
	*) pressanykey; startpt= ;;
esac
popd