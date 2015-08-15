try make mrproper
try make defconfig

#things that need kernel support
#iptables
#  network supt > network opts > network packet filtering (netfilter)
#nfsutils
#  file systems > network file systems > nfs client/server supt
#mdadm
#  device drv > mdadm
#							> raid supt
#							> autodetect raid arrays during boot
#							> raid10
# Device Drivers  --->
#	 Generic Driver Options  --->
#		 [ ] Support for uevent helper [CONFIG_UEVENT_HELPER]
#		 [*] Maintain a devtmpfs filesystem to mount at /dev [CONFIG_DEVTMPFS]
try menuconfig
exit 0 #for debugging
try make
try make modules_install