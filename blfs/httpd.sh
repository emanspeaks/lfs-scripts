groupadd -g 25 apache &&
useradd -c "Apache Server" -d /srv/www -g apache \
        -s /bin/false -u 25 apache

try patch -Np1 -i ../httpd-2.4.12-blfs_layout-1.patch           

sed 's/ldump_writer, &b/&, NULL/' -i modules/lua/mod_lua.c  
sed '/dir.*CFG_PREFIX/s@^@#@'     -i support/apxs.in        

./configure --enable-authnz-fcgi                            \
            --enable-layout=BLFS                            \
            --enable-mods-shared="all cgi"                  \
            --enable-mpms-shared=all                        \
            --enable-suexec=shared                          \
            --with-apr=/usr/bin/apr-1-config                \
            --with-apr-util=/usr/bin/apu-1-config           \
            --with-suexec-bin=/usr/lib/httpd/suexec         \
            --with-suexec-caller=apache                     \
            --with-suexec-docroot=/srv/www                  \
            --with-suexec-logfile=/var/log/httpd/suexec.log \
            --with-suexec-uidmin=100                        \
            --with-suexec-userdir=public_html               \
						--enable-ssl \
						--enable-dbd \
						--enable-session \
						--enable-session-cookie \
						--enable-session-crypto \
						--enable-session-dbd \
						--enable-rewrite 
try make
try make install                                 

try mv -v /usr/sbin/suexec /usr/lib/httpd/suexec
try chgrp apache           /usr/lib/httpd/suexec 
try chmod 4754             /usr/lib/httpd/suexec 
chown -v -R apache:apache /srv/www

pushd $bootscripts
try make install-httpd
popd