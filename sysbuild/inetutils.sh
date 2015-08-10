echo '#define PATH_PROCNET_DEV "/proc/net/dev"' >> ifconfig/system/linux.h 
try source $lfsroot/sysbuild/generic.sh
try mv -v /usr/bin/{hostname,ping,ping6,traceroute} /bin
try mv -v /usr/bin/ifconfig /sbin