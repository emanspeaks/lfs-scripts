groupadd -g 99 nogroup &&
useradd -c "Unprivileged Nobody" -d /dev/null -g nogroup \
    -s /bin/false -u 99 nobody
		
sed -i "/daemon_init/s:\!::" utils/statd/statd.c

try source $lfsroot/blfs/genericcheck.sh

try install -v -m644 $lfsroot/blfs/templates/nfs-server /etc/sysconfig/
try touch /etc/exports

pushd $bootscripts
try make install-nfs-server
try make install-nfs-client
try make install-netfs
popd