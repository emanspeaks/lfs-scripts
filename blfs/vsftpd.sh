try install -v -d -m 0755 /usr/share/vsftpd/empty
try install -v -d -m 0755 /home/ftp              
groupadd -g 47 vsftpd                         &&
groupadd -g 45 ftp                            &&

useradd -c "vsftpd User"  -d /dev/null -g vsftpd -s /bin/false -u 47 vsftpd &&
useradd -c anonymous_user -d /home/ftp -g ftp    -s /bin/false -u 45 ftp

echo "#define VSF_BUILD_SSL" >>builddefs.h
try make
try install -v -m 755 vsftpd        /usr/sbin/vsftpd    
try install -v -m 644 vsftpd.8      /usr/share/man/man8 
try install -v -m 644 vsftpd.conf.5 /usr/share/man/man5 
try install -v -m 644 vsftpd.conf   /etc

cat >> /etc/vsftpd.conf << "EOF"
background=YES
listen=YES
nopriv_user=vsftpd
secure_chroot_dir=/usr/share/vsftpd/empty
EOF

pushd $bootscripts
try make install-vsftpd
popd