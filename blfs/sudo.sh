try ./configure --prefix=/usr              \
            --libexecdir=/usr/lib      \
            --with-secure-path         \
            --with-all-insults         \
            --with-env-editor          \
            --docdir=/usr/share/doc/sudo-1.8.12 \
            --with-passprompt="[sudo] password for %p" \
						--disable-static
try make
env LC_ALL=C make check 2>&1 | tee ../make-check.log
echo "RESULTS OF CHECK"
grep failed ../make-check.log.
echo "END RESULTS"
pressanykey

try make install
try ln -sfv libsudo_util.so.0.0.0 /usr/lib/sudo/libsudo_util.so.0
try install -v -m644 $lfsroot/blfs/templates/pam.d/sudo /etc/pam.d/