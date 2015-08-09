try patch -Np1 -i ../glibc-2.21-fhs-1.
sed -e '/ia32/s/^/1:/' \
    -e '/SSE2/s/^1://' \
    -i  sysdeps/i386/i686/multiarch/mempcpy_chk.S
try mkdir -v ../glibc-build
pushd ../glibc-build

try ../glibc-2.21/configure    \
    --prefix=/usr          \
    --disable-profile      \
    --enable-kernel=2.6.32 \
    --enable-obsolete-rpc
try make
try make check
try touch /etc/ld.so.conf
try make install
try cp -v ../glibc-2.21/nscd/nscd.conf /etc/nscd.conf
try mkdir -pv /var/cache/nscd
try mkdir -pv /usr/lib/locale
try localedef -i cs_CZ -f UTF-8 cs_CZ.UTF-8
try localedef -i de_DE -f ISO-8859-1 de_DE
try localedef -i de_DE@euro -f ISO-8859-15 de_DE@euro
try localedef -i de_DE -f UTF-8 de_DE.UTF-8
try localedef -i en_GB -f UTF-8 en_GB.UTF-8
try localedef -i en_HK -f ISO-8859-1 en_HK
try localedef -i en_PH -f ISO-8859-1 en_PH
try localedef -i en_US -f ISO-8859-1 en_US
try localedef -i en_US -f UTF-8 en_US.UTF-8
try localedef -i es_MX -f ISO-8859-1 es_MX
try localedef -i fa_IR -f UTF-8 fa_IR
try localedef -i fr_FR -f ISO-8859-1 fr_FR
try localedef -i fr_FR@euro -f ISO-8859-15 fr_FR@euro
try localedef -i fr_FR -f UTF-8 fr_FR.UTF-8
try localedef -i it_IT -f ISO-8859-1 it_IT
try localedef -i it_IT -f UTF-8 it_IT.UTF-8
try localedef -i ja_JP -f EUC-JP ja_JP
try localedef -i ru_RU -f KOI8-R ru_RU.KOI8-R
try localedef -i ru_RU -f UTF-8 ru_RU.UTF-8
try localedef -i tr_TR -f UTF-8 tr_TR.UTF-8
try localedef -i zh_CN -f GB18030 zh_CN.GB18030

cat > /etc/nsswitch.conf << "EOF"
# Begin /etc/nsswitch.conf

passwd: files
group: files
shadow: files

hosts: files dns
networks: files

protocols: files
services: files
ethers: files
rpc: files

# End /etc/nsswitch.conf
EOF

try tar -xvf ../tzdata2015a.tar.gz

ZONEINFO=/usr/share/zoneinfo
try mkdir -pv $ZONEINFO/{posix,right}

for tz in etcetera southamerica northamerica europe africa antarctica  \
          asia australasia backward pacificnew systemv; do
    zic -L /dev/null   -d $ZONEINFO       -y "sh yearistype.sh" ${tz}
    zic -L /dev/null   -d $ZONEINFO/posix -y "sh yearistype.sh" ${tz}
    zic -L leapseconds -d $ZONEINFO/right -y "sh yearistype.sh" ${tz}
done

try cp -v zone.tab zone1970.tab iso3166.tab $ZONEINFO
try zic -d $ZONEINFO -p America/New_York
try cp -v $ZONEINFO/America/Chicago /etc/localtime
unset ZONEINFO

cat > /etc/ld.so.conf << "EOF"
# Begin /etc/ld.so.conf
/usr/local/lib
/opt/lib

EOF
cat >> /etc/ld.so.conf << "EOF"
# Add an include directory
include /etc/ld.so.conf.d/*.conf

EOF
try mkdir -pv /etc/ld.so.conf.d

popd
try rm -vrf ../glibc-build