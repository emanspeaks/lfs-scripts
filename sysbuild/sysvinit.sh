try patch -Np1 -i ../sysvinit-2.88dsf-consolidated-1.patch
try make -C src
try make -C src install