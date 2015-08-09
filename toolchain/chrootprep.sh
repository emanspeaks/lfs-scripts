#!/bin/bash
#this script assumes you are running with SUDO as user lfs:lfs

if [ -z $includedalready ]
then
	pushd `dirname $0` > /dev/null; mypath=`pwd`; popd > /dev/null
	lfsroot=$mypath/.. 
	lfsstage=sysbuild
	logpath=$lfsroot/logs/$lfsstage
  source $lfsroot/include/include.sh
fi

export LFS=/mnt/lfs
try chown -Rv root:root $LFS/tools
try mkdir -pv $LFS/{dev,proc,sys,run} 
try mknod -m 600 $LFS/dev/console c 5 1
try mknod -m 666 $LFS/dev/null c 1 3
