try tar -xvf ../nasm-2.11.06-xdoc.tar.xz --strip-components=1
try source $lfsroot/blfs/generic.sh
try install -m755 -d         /usr/share/doc/nasm-2.11.06/html
try cp -v doc/html/*.html    /usr/share/doc/nasm-2.11.06/html
try cp -v doc/*.{txt,ps,pdf} /usr/share/doc/nasm-2.11.06
try cp -v doc/info/*         /usr/share/info                  
try install-info /usr/share/info/nasm.info /usr/share/info/dir