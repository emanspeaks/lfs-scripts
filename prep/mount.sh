#!/bin/bash

if [ -z $includedalready ]
then
	pushd `dirname $0` > /dev/null; mypath=`pwd`; popd > /dev/null
	lfsroot=$mypath/..
	logpath=$lfsroot/logs/$lfsstage
  source $lfsroot/include/include.sh
fi

export LFS=/mnt/lfs
try mount -v -t ext4 /dev/md0p2 $LFS
try mount -v --bind $lfsroot $LFS/sources/lfs-scripts