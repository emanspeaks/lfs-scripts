#!/bin/bash
#this script assumes you are running as user lfs:lfs.

if [ -z $includedalready ]
then
	pushd `dirname $0` > /dev/null; mypath=`pwd`; popd > /dev/null
	lfsroot=$mypath #unique to main.sh since it's top-level
	logpath=$lfsroot/logs
  source $lfsroot/include/include.sh
fi

oldpwd=`pwd`
toolchain=$lfsroot/toolchain
wrap=$lfsroot/include/wrapper.sh

if [ $1 -ne "--skip-download" ]
then
	try source $lfsroot/prep/download.sh
fi


cd $toolchain
try $wrap binutils-2.25.tar.bz2 binutils1.sh

#try tar -xvf $LFS/sources/mpfr-3.1.2.tar.xz
#try tar -xvf $LFS/sources/gmp-6.0.0a.tar.xz
#try tar -xvf $LFS/sources/mpc-1.0.2.tar.gz

#try $wrap gcc-4.9.2.tar.bz2 gcc1.sh
#try $wrap linux-3.19.tar.xz linuxapi.sh


#genlist=()

cd $oldpwd