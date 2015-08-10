try patch -Np1 -i ../coreutils-8.23-i18n-1.patch 
try touch Makefile.in
try FORCE_UNSAFE_CONFIGURE=1 ./configure \
            --prefix=/usr            \
            --enable-no-install-program=kill,uptime
try make
try make NON_ROOT_USERNAME=nobody check-root
echo "dummy:x:1000:nobody" >> /etc/group
try chown -Rv nobody . 
su nobody -s /bin/bash \
          -c "PATH=$PATH make RUN_EXPENSIVE_TESTS=yes check"
sed -i '/dummy/d' /etc/group
try make install
try mv -v /usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} /bin
try mv -v /usr/bin/{false,ln,ls,mkdir,mknod,mv,pwd,rm} /bin
hash -r
try mv -v /usr/bin/{rmdir,stty,sync,true,uname} /bin
try mv -v /usr/bin/chroot /usr/sbin
try mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
sed -i s/\"1\"/\"8\"/1 /usr/share/man/man8/chroot.8
try mv -v /usr/bin/{head,sleep,nice,test,[} /bin

