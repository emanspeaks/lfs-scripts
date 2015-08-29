try patch -Np1 -i ../bind-9.10.1-P2-use_iproute2-1.patch

try source $lfsroot/blfs/generic.sh

try chmod -v 0755 /usr/lib/lib{bind9,dns,isc{,cc,cfg},lwres}.so
try install -v -m755 -d /usr/share/doc/bind-9.10.1-P2/{arm,misc} 
try install -v -m644    doc/arm/*.html \
                    /usr/share/doc/bind-9.10.1-P2/arm 
try install -v -m644 \
    doc/misc/{dnssec,ipv6,migrat*,options,rfc-compliance,roadmap,sdb} \
    /usr/share/doc/bind-9.10.1-P2/misc
		
groupadd -g 20 named &&
useradd -c "BIND Owner" -g named -s /bin/false -u 20 named
try install -d -m770 -o named -g named /srv/named

pushd /srv/named
try mkdir -p dev etc/namedb/{slave,pz} usr/lib/engines var/run/named
try mknod /srv/named/dev/null c 1 3 
try mknod /srv/named/dev/urandom c 1 9 
try chmod 666 /srv/named/dev/{null,urandom} 
try cp /etc/localtime etc 
try touch /srv/named/managed-keys.bind
try cp /usr/lib/engines/libgost.so usr/lib/engines 
[ $(uname -m) = x86_64 ] && try ln -sv lib usr/lib64
popd

rndc-confgen -r /dev/urandom -b 512 > /etc/rndc.conf &&
sed '/conf/d;/^#/!d;s:^# ::' /etc/rndc.conf > /srv/named/etc/named.conf

try install -v -m644 $lfsroot/blfs/templates/named.conf /srv/named/etc/
try install -v -m644 $lfsroot/blfs/templates/127.0.0 /srv/named/etc/namedb/pz/
try install -v -m644 $lfsroot/blfs/templates/roots.hints /srv/named/etc/namedb/

try chown -R named:named /srv/named

pushd $bootscripts
try make install-bind
popd

/etc/rc.d/init.d/bind start