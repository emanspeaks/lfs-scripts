try source $lfsroot/sysbuild/generic.sh

for target in depmod insmod lsmod modinfo modprobe rmmod; do
  try ln -sv ../bin/kmod /sbin/$target
done

try ln -sv kmod /bin/lsmod