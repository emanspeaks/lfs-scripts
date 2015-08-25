groupadd -g 87 ntp &&
useradd -c "Network Time Protocol" -d /var/lib/ntp -u 87 \
        -g ntp -s /bin/false ntp
try source $lfsroot/blfs/genericcheck.sh
install -v -o ntp -g ntp -d /var/lib/ntp

try install -v -m644 $lfsroot/blfs/templates/ntp.conf /etc/

pushd $bootscripts
try make install-ntpd
popd

try ln -v -sf ../init.d/setclock /etc/rc.d/rc0.d/K46setclock
try ln -v -sf ../init.d/setclock /etc/rc.d/rc6.d/K46setclock