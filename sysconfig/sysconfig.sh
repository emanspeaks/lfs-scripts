bash /lib/udev/init-net-rules.sh
cat /etc/udev/rules.d/70-persistent-net.rules
 
# I want optical drive to by-path persistence since it will always
# be on the same SATA port all the time and won't care if I swap devs
udevadm test /sys/block/sr0
sed -i -e 's/"write_cd_rules"/"write_cd_rules by-path"/' \
/etc/udev/rules.d/83-cdrom-symlinks.rules

# for me, eno1 is intranet, eno2 is server/internet
install -m 755 $lfsroot/sysconfig/templates/ifconfig.* /etc/sysconfig/
install -m 755 $lfsroot/sysconfig/templates/resolv.conf /etc/
install -m 755 $lfsroot/sysconfig/templates/host* /etc/