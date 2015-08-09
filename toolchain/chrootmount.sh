#!/bin/bash
#this script assumes you are running with SUDO as user lfs:lfs

if [ -z $includedalready ]
then
	pushd `dirname $0` > /dev/null; mypath=`pwd`; popd > /dev/null
	lfsroot=$mypath/.. 
	export lfsstage=sysbuild
	logpath=$lfsroot/logs/$lfsstage
  source $lfsroot/include/include.sh
fi

export LFS=/mnt/lfs
try mount -v --bind /dev $LFS/dev
try mount -vt devpts devpts $LFS/dev/pts -o gid=5,mode=620
try mount -vt proc proc $LFS/proc
try mount -vt sysfs sysfs $LFS/sys
try mount -vt tmpfs tmpfs $LFS/run
if [ -h $LFS/dev/shm ]; then
  try mkdir -pv $LFS/$(readlink $LFS/dev/shm)
fi
