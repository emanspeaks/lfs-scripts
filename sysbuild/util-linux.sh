try mkdir -pv /var/lib/hwclock
try ./configure ADJTIME_PATH=/var/lib/hwclock/adjtime     \
            --docdir=/usr/share/doc/util-linux-2.26 \
            --disable-chfn-chsh  \
            --disable-login      \
            --disable-nologin    \
            --disable-su         \
            --disable-setpriv    \
            --disable-runuser    \
            --disable-pylibmount \
            --without-python     \
            --without-systemd    \
            --without-systemdsystemunitdir
try make
# skipping tests
try make install