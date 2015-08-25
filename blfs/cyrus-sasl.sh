try patch -Np1 -i ../cyrus-sasl-2.1.26-fixes-3.patch 
try autoreconf -fi 

try ./configure --prefix=/usr        \
            --sysconfdir=/etc    \
            --enable-auth-sasldb \
            --with-dbpath=/var/lib/sasl/sasldb2 \
            --with-saslauthd=/var/run/saslauthd
try make -j1
try make install
try install -v -dm755 /usr/share/doc/cyrus-sasl-2.1.26 
try install -v -m644  doc/{*.{html,txt,fig},ONEWS,TODO} \
    saslauthd/LDAP_SASLAUTHD /usr/share/doc/cyrus-sasl-2.1.26 
try install -v -dm700 /var/lib/sasl

#skipped the bootscript since I'm not sure I need it yet
# pushd $bootscripts
# try make install-saslauthd
# popd
