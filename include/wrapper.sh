#!/bin/bash

if [ -z $includedalready ]
then
	pushd `dirname $0` > /dev/null; mypath=`pwd`; popd > /dev/null
	lfsroot=$mypath/..
	logpath=$lfsroot/logs/$lfsstage
  source $lfsroot/include/include.sh
fi

if [ "$2" == "generic.sh" ]
then
	logfn=${1%-*}
else
  logfn=${2%.sh}
fi
setlogname $logfn
pushd `dirname $2` > /dev/null; srcpath=`pwd`; popd > /dev/null

extraopts=${@:3}

pushd $LFS/sources
try tar -xvf $1
tardir=${1%%.*}
tardir=$(ls -d $(echo ${tardir%%-*} | sed 's/[^a-zA-Z\-]//g')*/)
pkgname=$(echo $tardir | sed 's/[^a-zA-Z\-]//g')
pkgname=${pkgname%-*}
cd $tardir

try source $srcpath/$2

cd ..
try rm -rvf $tardir
setlogname $myname
popd