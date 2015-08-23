try install -v -m644 $lfsroot/sysconfig/templates/fstab /etc/
try install -v -m755 $lfsroot/sysconfig/templates/mkinitramfs /sbin/
try install -v -m644 $lfsroot/sysconfig/templates/config-3.19.0-StretchYourMindEnt /boot/
try install -v -m644 $lfsroot/sysconfig/templates/grub.cfg /boot/grub/
try install -v -m644 $lfsroot/sysconfig/templates/lsb-release /etc/
try install -v -m644 $lfsroot/sysconfig/templates/lfs-release /etc/
try mkdir -pv /usr/share/mkinitramfs
try install -v -m644 $lfsroot/sysconfig/templates/init.in /usr/share/mkinitramfs/