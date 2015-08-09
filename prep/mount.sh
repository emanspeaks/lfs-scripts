#!/bin/bash

if [ -z $includedalready ]
then
	pushd `dirname $0` > /dev/null; mypath=`pwd`; popd > /dev/null
	lfsroot=$mypath/..
	logpath=$lfsroot/logs
  source $lfsroot/include/include.sh
fi

try mount -v -t ext4 /dev/md0p2 /mnt/lfs
try mount -v --bind $lfsroot $LFS/sources/lfs-scripts