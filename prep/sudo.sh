#!/bin/bash

if [ -z $includedalready ]
then
	pushd `dirname $0` > /dev/null; mypath=`pwd`; popd > /dev/null
	lfsroot=$mypath/..
	logpath=$lfsroot/logs
	
	#unique to sudo.sh
	mkdir -v $logpath
	chmod 777 $logpath
	#end unique to sudo.sh
	
  source $lfsroot/include/include.sh
fi

export LFS=/mnt/lfs
try chmod 777 $LFS
try groupadd lfs
try useradd -s /bin/bash -g lfs -m -k $mypath/skel lfs
try mkdir -v $LFS/{sources{,/lfs-scripts},tools}
try chmod -v a+wt $LFS/sources
try ln -sv $LFS/tools /
try mkdir -v /tools/lib
case $(uname -m) in
  x86_64)  try ln -sv lib /tools/lib64 ;;
esac
try chown -v lfs:lfs $LFS/{sources,tools{,/lib}}
try mount -v --bind $lfsroot $LFS/sources/lfs-scripts
passwd lfs