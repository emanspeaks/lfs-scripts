#!/bin/bash

if [ -z $includedalready ]
then
	pushd `dirname $0` > /dev/null; mypath=`pwd`; popd > /dev/null
	lfsroot=$mypath/..
	logpath=$lfsroot/logs/$lfsstage
  source $lfsroot/include/include.sh
fi

export LFS=/mnt/lfs
try mount -v -t ext4 /dev/syme/lfsroot $LFS
try mount -v -t ext4 /dev/syme/var $LFS/var
try mount -v -t ext4 /dev/syme/home $LFS/home
try mount -v -t ext4 /dev/syme/tools $LFS/tools
try mount -v -t ext4 /dev/sda2 $LFS/boot
try mount -v --bind $lfsroot $LFS/sources/lfsscripts
