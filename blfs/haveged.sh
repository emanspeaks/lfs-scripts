try source $lfsroot/blfs/genericcheck.sh
try mkdir -pv    /usr/share/doc/haveged-1.9.1
try cp -v README /usr/share/doc/haveged-1.9.1

pushd $bootscripts
try make install-haveged
popd