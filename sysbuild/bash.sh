try patch -Np1 -i ../bash-4.3.30-upstream_fixes-1.patch
try ./configure --prefix=/usr                    \
            --bindir=/bin                    \
            --docdir=/usr/share/doc/bash-4.3.30 \
            --without-bash-malloc            \
            --with-installed-readline
try make
try chown -Rv nobody .
su nobody -s /bin/bash -c "PATH=$PATH make tests"
try make install