try tar -xvf ../Linux-PAM-1.1.8-docs.tar.bz2 --strip-components=1
try ./configure --prefix=/usr \
            --sysconfdir=/etc \
            --libdir=/usr/lib \
            --enable-securedir=/lib/security \
            --docdir=/usr/share/doc/Linux-PAM-1.1.8
try make
try install -v -m755 -d /etc/pam.d
try install -v -m644 $lfsroot/blfs/templates/other /etc/pam.d/
try make check
try rm -rfv /etc/pam.d
try make install
try chmod -v 4755 /sbin/unix_chkpwd
for file in pam pam_misc pamc
do
  mv -v /usr/lib/lib${file}.so.* /lib &&
  ln -sfv ../../lib/$(readlink /usr/lib/lib${file}.so) /usr/lib/lib${file}.so
done