#!/bin/bash
#this script assumes you are logged into LFS system 
# and running as user ROOT

if [ -z $includedalready ]
then
	pushd `dirname $0` > /dev/null; mypath=`pwd`; popd > /dev/null
	lfsroot=$mypath #unique to blfsmain.sh since it's top-level
	export lfsstage=blfs
	logpath=$lfsroot/logs/$lfsstage
  source $lfsroot/include/include.sh
fi

wrap=$lfsroot/include/wrapper.sh
startpt=$1

if [ -z $startpt ]
then
	startpt=1
fi

pushd $lfsroot/blfs
case $startpt in
#	1) ptry $wrap lfs-bootscripts-20150222.tar.bz2 lfs-bootscripts.sh ;&
# 2) ptry source udevconfig.sh ;&
# 5) ptry $wrap inetutils-1.9.2.tar.gz inetutils.sh \
						--localstatedir=/var   \
            --disable-logger       \
            --disable-whois        \
            --disable-servers ;&
  1) 

	
		
	*) pressanykey; startpt= ;;
esac
popd