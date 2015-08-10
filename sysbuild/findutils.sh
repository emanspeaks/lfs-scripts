try source $lfsroot/sysbuild/generic.sh
try mv -v /usr/bin/find /bin
sed -i 's|find:=${BINDIR}|find:=/bin|' /usr/bin/updatedb