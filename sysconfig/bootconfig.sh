try install -m 755 $lfsroot/sysconfig/templates/fstab /etc/
try install -m 755 $lfsroot/sysconfig/templates/mkinitramfs /sbin/
try install -m 755 $lfsroot/sysconfig/templates/config-3.19.0-StretchYourMindEnt /boot/
try install -m 755 $lfsroot/sysconfig/templates/grub.cfg /boot/grub/
try install -m 755 $lfsroot/sysconfig/templates/lsb-release /etc/
try install -m 755 $lfsroot/sysconfig/templates/lfs-release /etc/
try mkdir -p /usr/share/mkinitramfs
try install -m 755 $lfsroot/sysconfig/templates/init.in /usr/share/mkinitramfs/