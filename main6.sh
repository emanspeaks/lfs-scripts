#!/bin/bash
#this script assumes you are CHROOTED and running as user ROOT

if [ -z $includedalready ]
then
	pushd `dirname $0` > /dev/null; mypath=`pwd`; popd > /dev/null
	lfsroot=$mypath #unique to main6.sh since it's top-level
	export lfsstage=sysconfig
	logpath=$lfsroot/logs/$lfsstage
  source $lfsroot/include/include.sh
fi

wrap=$lfsroot/include/wrapper.sh
startpt=$1

if [ -z $startpt ]
then
	startpt=1
fi

pushd $lfsroot/sysconfig
case $startpt in
	1) ptry $wrap lfs-bootscripts-20150222.tar.bz2 lfs-bootscripts.sh ;&
	2) ptry source udevconfig.sh ;&
	3) ptry source netconfig.sh ;&
	4) ptry source initconfig.sh ;&
	5) ptry source consoleconfig.sh ;&
	6) ptry source bootconfig.sh ;&
#	7) ptry $wrap linux-3.19.tar.xz linux.sh ;&
	
		
	*) pressanykey; startpt= ;;
esac
popd
