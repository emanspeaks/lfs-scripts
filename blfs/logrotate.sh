try ./autogen.sh 
try ./configure --prefix=/usr
try make
try make test
try make install

try install -v -m644 $lfsroot/blfs/templates/logrotate.conf /etc/
try  mkdir -pv /etc/logrotate.d

#fcron: 0 3 * * *   /usr/sbin/logrotate /etc/logrotate.conf