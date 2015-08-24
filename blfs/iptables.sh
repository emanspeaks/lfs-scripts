try source $lfsroot/blfs/generic.sh
try ln -sfv ../../sbin/xtables-multi /usr/bin/iptables-xml
for file in ip4tc ip6tc ipq iptc xtables
do
  try mv -v /usr/lib/lib${file}.so.* /lib
  try ln -sfv ../../lib/$(readlink /usr/lib/lib${file}.so) /usr/lib/lib${file}.so
done

pushd $bootscripts
try make install-iptables
popd

try install -v -m700 $lfsroot/blfs/templates/rc.iptables /etc/rc.d/