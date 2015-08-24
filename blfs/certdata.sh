try install -v -m755 $lfsroot/blfs/templates/make-c{ert.pl,a.sh} /usr/bin/
try install -v -m755 $lfsroot/blfs/templates/remove-expired-certs.sh /usr/bin/

pushd /src
try make-ca.sh
try remove-expired-certs.sh certs

SSLDIR=/etc/ssl                                             
try install -d ${SSLDIR}/certs                                  
try cp -v certs/*.pem ${SSLDIR}/certs                           
try c_rehash                                                   
try install BLFS-ca-bundle*.crt ${SSLDIR}/ca-bundle.crt         
try ln -sfv ../ca-bundle.crt ${SSLDIR}/certs/ca-certificates.crt
unset SSLDIR

try rm -vfr certs BLFS-ca-bundle*
popd
