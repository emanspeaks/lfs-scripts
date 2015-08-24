sed -i "s|n/a|unavailable|" lsb_release
./help2man -N --include ./lsb_release.examples \
              --alt_version_key=program_version ./lsb_release > lsb_release.1
try install -v -m 644 lsb_release.1 /usr/share/man/man1/lsb_release.1
try install -v -m 755 lsb_release /usr/bin/lsb_release