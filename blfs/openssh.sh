try install -v -m700 -d /var/lib/sshd
try chown   -v root:sys /var/lib/sshd

groupadd -g 50 sshd &&
useradd -c 'sshd PrivSep' -d /var/lib/sshd -g sshd -s /bin/false -u 50 sshd

try ./configure --prefix=/usr                     \
            --sysconfdir=/etc/ssh             \
            --with-md5-passwords              \
            --with-privsep-path=/var/lib/sshd
try make

try cp -v scp /usr/bin
try make tests

try make install                                  
try install -v -m755 contrib/ssh-copy-id /usr/bin 
try install -v -m644 contrib/ssh-copy-id.1 /usr/share/man/man1 
try install -v -m755 -d /usr/share/doc/openssh-6.7p1           
try install -v -m644 INSTALL LICENCE OVERVIEW README* /usr/share/doc/openssh-6.7p1

echo "PermitRootLogin no" >> /etc/ssh/sshd_config
sed 's@d/login@d/sshd@g' /etc/pam.d/login > /etc/pam.d/sshd &&
chmod 644 /etc/pam.d/sshd &&
echo "UsePAM yes" >> /etc/ssh/sshd_config

pushd $bootscripts
try make install-sshd
popd