#!/bin/bash
#assumed run as root and NOT chrooted!!!

if [ -z $includedalready ]
then
	pushd `dirname $0` > /dev/null; mypath=`pwd`; popd > /dev/null
	lfsroot=$mypath/..
	logpath=$lfsroot/logs
  source $lfsroot/include/include.sh
fi

LFS=/mnt/lfs

install -v -m644 $lfsroot/blfs/templates/bashrc $LFS/etc/
install -v -m644 $lfsroot/sysconfig/templates/profile $LFS/etc/
install -v --directory --mode=0755 --owner=root --group=root $LFS/etc/profile.d
install -v -m644 $lfsroot/blfs/templates/profile.d/* $LFS/etc/profile.d/
install -v --directory --mode=0755 --owner=root --group=root $LFS/etc/skel
install -v -m600 $lfsroot/blfs/templates/skel/.* $LFS/etc/skel/
install -v -m600 $lfsroot/blfs/templates/skel/.* $LFS/root/
dircolors -p > $LFS/etc/dircolors
clear > $LFS/etc/issue

setlogname blfs-download
pushd $LFS/sources

try cp -v $lfsroot/blfs/{blfs-list,blfs-md5sums} .
try wget --input-file=blfs-list --continue
try md5sum -c blfs-md5sums

popd
setlogname $myname