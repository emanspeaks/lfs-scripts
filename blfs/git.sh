try ./configure --prefix=/usr --with-gitconfig=/etc/gitconfig --with-libpcre
try make
try make test
try make install

try tar -xvf ../git-manpages-2.3.0.tar.xz \
    -C /usr/share/man --no-same-owner --no-overwrite-dir
try mkdir -vp   /usr/share/doc/git-2.3.0
try tar   -xvf   ../git-htmldocs-2.3.0.tar.xz \
      -C    /usr/share/doc/git-2.3.0 --no-same-owner --no-overwrite-dir
find        /usr/share/doc/git-2.3.0 -type d -exec chmod 755 {} \;
find        /usr/share/doc/git-2.3.0 -type f -exec chmod 644 {} \;

try mkdir -vp /usr/share/doc/git-2.3.0/man-pages/{html,text}         
try mv        /usr/share/doc/git-2.3.0/{git*.txt,man-pages/text}     
try mv        /usr/share/doc/git-2.3.0/{git*.,index.,man-pages/}html 
try mkdir -vp /usr/share/doc/git-2.3.0/technical/{html,text}         
try mv        /usr/share/doc/git-2.3.0/technical/{*.txt,text}        
try mv        /usr/share/doc/git-2.3.0/technical/{*.,}html           
try mkdir -vp /usr/share/doc/git-2.3.0/howto/{html,text}             
try mv        /usr/share/doc/git-2.3.0/howto/{*.txt,text}            
try mv        /usr/share/doc/git-2.3.0/howto/{*.,}html