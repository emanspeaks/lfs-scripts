sed -i 's/groups$(EXEEXT) //' src/Makefile.in
find man -name Makefile.in -exec sed -i 's/groups\.1 / /' {} \;
sed -i -e 's@#ENCRYPT_METHOD DES@ENCRYPT_METHOD SHA512@' \
       -e 's@/var/spool/mail@/var/mail@' etc/login.defs
sed -i 's/1000/999/' etc/useradd
try ./configure --sysconfdir=/etc --with-group-name-max-length=32
try make
try make install
try mv -v /usr/bin/passwd /bin
try pwconv
try grpconv
sed -i 's/yes/no/' /etc/default/useradd
passwd root