# for me, eno1 is intranet, eno2 is server/internet
try install -v -m644 $lfsroot/sysconfig/templates/ifconfig.* /etc/sysconfig/
try install -v -m644 $lfsroot/sysconfig/templates/resolv.conf /etc/
try install -v -m644 $lfsroot/sysconfig/templates/host* /etc/