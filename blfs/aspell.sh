try source $lfsroot/blfs/generic.sh
try install -v -m755 -d /usr/share/doc/aspell-0.60.6.1/aspell{,-dev}.html
try install -v -m644 manual/aspell.html/* \
    /usr/share/doc/aspell-0.60.6.1/aspell.html
try install -v -m644 manual/aspell-dev.html/* \
    /usr/share/doc/aspell-0.60.6.1/aspell-dev.html
try install -v -m 755 scripts/ispell /usr/bin/
try install -v -m 755 scripts/spell /usr/bin/