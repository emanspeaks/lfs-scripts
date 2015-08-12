# for me, eno1 is intranet, eno2 is server/internet
try install -m 755 $lfsroot/sysconfig/templates/ifconfig.* /etc/sysconfig/
try install -m 755 $lfsroot/sysconfig/templates/resolv.conf /etc/
try install -m 755 $lfsroot/sysconfig/templates/host* /etc/