try ./configure --prefix=/usr \
            --enable-symcryptrun \
            --docdir=/usr/share/doc/gnupg-2.0.26
try make 
try makeinfo --html --no-split -o doc/gnupg_nochunks.html doc/gnupg.texi 
try makeinfo --plaintext       -o doc/gnupg.txt           doc/gnupg.texi
try make -C doc pdf ps html
try make check
try make install
try install -v -m755 -d /usr/share/doc/gnupg-2.0.26/html            
try install -v -m644    doc/gnupg_nochunks.html \
                    /usr/share/doc/gnupg-2.0.26/html/gnupg.html 
try install -v -m644    doc/*.texi doc/gnupg.txt \
                    /usr/share/doc/gnupg-2.0.26
										
for f in gpg gpgv
do
  ln -svf ${f}2.1 /usr/share/man/man1/$f.1 &&
  ln -svf ${f}2   /usr/bin/$f
done
unset f

try install -v -m644 doc/gnupg.html/* \
                 /usr/share/doc/gnupg-2.0.26/html 
try install -v -m644 doc/gnupg.{pdf,dvi,ps} \
                 /usr/share/doc/gnupg-2.0.26