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
oldpwd=`pwd`
oldout=$outlog
olderr=$errlog
oldcmd=$cmdlog
outlog=$logpath/$logfn-out.log
errlog=$logpath/$logfn-err.log
cmdlog=$logpath/$logfn-cmd.log

cd $LFS/sources
try tar -xvf $1
cd ${1%.tar*}

try source $2

cd ..
try rm -rf ${1%.tar*}
outlog=$oldout
errlog=$olderr
cmdlog=$oldcmd
cd $oldpwd