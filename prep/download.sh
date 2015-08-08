#!/bin/bash

if [ -z $includedalready ]
then
	pushd `dirname $0` > /dev/null; mypath=`pwd`; popd > /dev/null
	lfsroot=$mypath/..
	logpath=$lfsroot/logs
  source $lfsroot/include/include.sh
fi

pushd $LFS/sources
try wget http://linuxfromscratch.org/lfs/downloads/7.7/wget-list
try wget http://linuxfromscratch.org/lfs/downloads/7.7/md5sums
try wget --input-file=wget-list --continue
try md5sum -c md5sums
popd