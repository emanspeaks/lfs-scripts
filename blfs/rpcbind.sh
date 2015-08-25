sed -i "/servname/s:rpcbind:sunrpc:" src/rpcbind.c &&
sed -i "/error = getaddrinfo/s:rpcbind:sunrpc:" src/rpcinfo.c
try source $lfsroot/blfs/generic.sh

pushd $bootscripts
try make install-rpcbind
popd