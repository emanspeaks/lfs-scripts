sed -i 's:LIBDIR:PAM_&:g' pam_cap/Makefile &&
try make
sed -i '/install.*STALIBNAME/ s/^/#/' libcap/Makefile
try make prefix=/usr \
     SBINDIR=/sbin \
     PAM_LIBDIR=/lib \
     RAISE_SETFCAP=no install
try chmod -v 755 /usr/lib/libcap.so &&
try mv -v /usr/lib/libcap.so.* /lib &&
try ln -sfv ../../lib/libcap.so.2 /usr/lib/libcap.so