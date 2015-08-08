#!/bin/bash

if [ -z $includedalready ]
then
	pushd `dirname $0` > /dev/null; mypath=`pwd`; popd > /dev/null
	lfsroot=$mypath/..
	logpath=$lfsroot/logs
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

pushd $LFS/sources
try tar -xvf $1
cd ${1%.tar*}

try source $srcpath/$2

cd ..
try rm -rvf ${1%.tar*}
setlogname $myname
popd