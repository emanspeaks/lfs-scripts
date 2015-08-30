#!/bin/bash
#this script assumes you are logged into LFS system 
# and running as user ROOT

if [ -z $includedalready ]
then
	pushd `dirname $0` > /dev/null; mypath=`pwd`; popd > /dev/null
	lfsroot=$mypath #unique to blfsmain.sh since it's top-level
	export lfsstage=blfs
	logpath=$lfsroot/logs/$lfsstage
  source $lfsroot/include/include.sh
fi

wrap=$lfsroot/include/wrapper.sh
bootscripts=/src/blfs-bootscripts-20150304
startpt=$1

if [ -z $startpt ]
then
	startpt=1
fi

pushd $lfsroot/blfs
case $startpt in				
  1) pushd /src
		 try tar -xvf blfs-bootscripts-20150304.tar.bz2
		 popd 
		 ;&

	2) ptry $wrap time-1.7.tar.gz time.sh --infodir=/usr/share/info ;&
	3) ptry $wrap Linux-PAM-1.1.8.tar.bz2 Linux-PAM.sh ;&
	4) ptry $wrap shadow-4.2.1.tar.xz shadow.sh ;&
	5) ptry $wrap libcap-2.24.tar.xz libcap.sh ;&
	6) ptry $wrap which-2.20.tar.gz generic.sh ;&
	7) ptry $wrap iptables-1.4.21.tar.bz2 iptables.sh \
            --sbindir=/sbin \
            --enable-libipq \
            --with-xtlibdir=/lib/xtables ;&
	
	8) 
		pushd $bootscripts
		try make install-random
		popd
		;&
		
	9) ptry $wrap haveged-1.9.1.tar.gz haveged.sh ;&
	10) ptry $wrap lsb-release-1.4.tar.gz lsb.sh ;&
	11) ptry $wrap db-6.1.19.tar.gz db.sh ;&
	12) ptry $wrap nasm-2.11.06.tar.xz nasm.sh ;&
	13) ptry $wrap libjpeg-turbo-1.4.0.tar.gz libjpeg.sh ;&
	14) ptry $wrap tiff-4.0.3.tar.gz generic.sh --disable-static ;&
	15) ptry $wrap libpng-1.6.16.tar.xz libpng.sh --disable-static ;&
	16) ptry $wrap freetype-2.5.5.tar.bz2 freetype.sh --disable-static ;&
	17) ptry $wrap icu4c-54_1-src.tgz icu.sh ;&
	18) ptry $wrap lcms2-2.6.tar.gz genericcheck.sh --disable-static ;&
	19) ptry $wrap ghostscript-9.15.tar.bz2 ghostscript.sh \
		--disable-compile-inits \
		--enable-dynamic \
		--with-system-libtiff \
		--disable-cups ;&
	20) ptry $wrap libgpg-error-1.18.tar.bz2 libgpg-error.sh --disable-static ;&
	21) ptry $wrap pth-2.0.7.tar.gz pth.sh ;&
	22) ptry $wrap libgcrypt-1.6.2.tar.bz2 libgcrypt.sh ;&
	23) ptry $wrap openssl-1.0.2.tar.gz openssl.sh ;&
	24) ptry source certdata.sh ;&
	25) ptry $wrap nettle-2.7.1.tar.gz nettle.sh ;&
	26) ptry $wrap libtasn1-4.2.tar.gz libtasn.sh --disable-static ;&
	27) ptry $wrap gnutls-3.3.12.tar.xz gnutls.sh \
		--with-default-trust-store-file=/etc/ssl/ca-bundle.crt ;&
	28) ptry $wrap pcre-8.36.tar.bz2 pcre.sh \
						--docdir=/usr/share/doc/pcre-8.36 \
            --enable-unicode-properties       \
            --enable-pcre16                   \
            --enable-pcre32                   \
            --enable-pcregrep-libz            \
            --enable-pcregrep-libbz2          \
            --enable-pcretest-libreadline     \
            --disable-static  ;&
						
	29) 
		ptry $wrap wget-1.16.1.tar.xz generic.sh --sysconfdir=/etc 
		echo ca-directory=/etc/ssl/certs >> /etc/wgetrc ;&
	
	30) ptry $wrap curl-7.40.0.tar.lzma curl.sh \
						--disable-static           \
						--without-ssl --with-gnutls \
            --enable-threaded-resolver ;&
	31) ptry $wrap libffi-3.2.1.tar.gz libffi.sh --disable-static ;&
	
	32) 
		ptry $wrap Python-2.7.9.tar.xz generic.sh \
						--enable-shared     \
            --with-system-expat \
            --with-system-ffi   \
            --enable-unicode=ucs4 \
						--with-dbmliborder=bdb:gdbm:ndbm 
		try chmod -v 755 /usr/lib/libpython2.7.so.1.0
		;&
		
	33) ptry $wrap ruby-2.2.0.tar.xz generic.sh \
						--enable-shared \
            --docdir=/usr/share/doc/ruby-2.2.0 ;&
	34) ptry $wrap install-tl-unx.tar.gz install-tl.sh ;&
	35) ptry $wrap git-2.3.0.tar.xz git.sh ;&
	36) ptry $wrap Python-3.4.2.tar.xz Python.sh ;&
	37) ptry $wrap libxml2-2.9.2.tar.gz libxml2.sh ;&
	38) ptry $wrap unzip60.tar.gz unzip.sh ;&
	39) ptry source docbook-xml.sh ;&
	40) ptry $wrap docbook-xsl-1.78.1.tar.bz2 docbook-xsl.sh ;&
	41) ptry $wrap libxslt-1.1.28.tar.gz genericcheck.sh --disable-static ;&
	42) ptry $wrap fontconfig-2.11.1.tar.bz2 fontconfig.sh \
						--sysconfdir=/etc    \
            --localstatedir=/var \
            --disable-docs       \
            --docdir=/usr/share/doc/fontconfig-2.11.1 ;&
	43) ptry $wrap graphviz-2.38.0.tar.gz graphviz.sh ;&
	44) ptry $wrap xapian-core-1.2.19.tar.xz genericcheck.sh \
						--disable-static \
            --docdir=/usr/share/doc/xapian-core-1.2.19 ;&
	45) ptry $wrap doxygen-1.8.9.1.src.tar.gz doxygen.sh ;&
	46) ptry $wrap glib-2.42.1.tar.xz generic.sh --with-pcre=system --with-python=python3 ;&
	47) ptry $wrap harfbuzz-0.9.38.tar.bz2 genericcheck.sh --with-gobject ;&
	48) ptry $wrap freetype-2.5.5.tar.bz2 freetype.sh --disable-static ;&
	49) ptry $wrap libksba-1.3.2.tar.bz2 genericcheck.sh ;&
	50) ptry $wrap libassuan-2.2.0.tar.bz2 libassuan.sh ;&
	51) ptry $wrap pinentry-0.9.0.tar.bz2 pinentry.sh ;&
	52) ptry $wrap lzo-2.09.tar.gz lzo.sh ;&
	53) ptry $wrap libarchive-3.1.2.tar.gz genericcheck.sh --disable-static ;&
	54) ptry $wrap cmake-3.1.3.tar.gz cmake.sh ;&
	55) ptry $wrap libevent-2.0.22-stable.tar.gz libevent.sh ;&
	56) ptry $wrap mariadb-10.0.16.tar.gz mariadb.sh ;&
	57) ptry $wrap cyrus-sasl-2.1.26.tar.gz cyrus-sasl.sh ;&
	58) ptry $wrap postfix-3.0.0.tar.gz postfix.sh ;&
	59) ptry $wrap gnupg-2.0.26.tar.bz2 gnupg.sh ;&
	60) ptry $wrap ntp-4.2.8p1.tar.gz ntp.sh \
						--bindir=/usr/sbin    \
            --sysconfdir=/etc     \
            --enable-linuxcaps    \
            --with-lineeditlibs=readline \
            --docdir=/usr/share/doc/ntp-4.2.8p1 ;&
	61) ptry $wrap openssh-6.7p1.tar.gz openssh.sh ;&
	62) ptry $wrap vsftpd-3.0.2.tar.gz vsftpd.sh ;&
	63) ptry $wrap fcron-3.2.0.src.tar.gz fcron.sh \
						--sysconfdir=/etc      \
            --localstatedir=/var   \
            --with-boot-install=no \
            --with-systemdsystemunitdir=no ;&
	64) ptry $wrap popt-1.16.tar.gz popt.sh ;&
	65) ptry $wrap logrotate-3.8.9.tar.gz logrotate.sh ;&
	66) ptry $wrap libtirpc-0.2.5.tar.bz2 libtirpc.sh \
	          --sysconfdir=/etc \
            --disable-static  \
            --disable-gssapi ;&
	67) ptry $wrap lsof_4.88.tar.bz2 lsof.sh ;&
	68) ptry $wrap rpcbind-0.2.2.tar.bz2 rpcbind.sh \
						--bindir=/sbin      \
            --with-rpcuser=root \
            --without-systemdsystemunitdir ;&
	69) ptry $wrap nfs-utils-1.3.2.tar.bz2 nfs-utils.sh \
						--sysconfdir=/etc      \
            --without-tcp-wrappers \
            --disable-nfsv4        \
            --disable-gss ;&
	70) ptry $wrap cifs-utils-6.4.tar.bz2 generic.sh \
						--disable-systemd	\
						--with-pamdir=/lib/security ;&
	71) ptry $wrap bind-9.10.1-P2.tar.gz bind.sh \
						--sysconfdir=/etc       \
            --localstatedir=/var    \
            --mandir=/usr/share/man \
            --enable-threads        \
            --with-libtool          \
            --disable-static        \
            --with-randomdev=/dev/urandom ;&
	72) ptry $wrap apr-1.5.1.tar.bz2 apr.sh ;&
	73) ptry $wrap apr-util-1.5.4.tar.bz2 apr-util.sh ;&
	74) ptry $wrap httpd-2.4.12.tar.bz2 httpd.sh ;&
# http://downloads.sourceforge.net/project/mcrypt/Libmcrypt/2.5.8/libmcrypt-2.5.8.tar.gz
# http://ftp.gnu.org/gnu/aspell/aspell-0.60.6.1.tar.gz
# http://www.abisource.com/downloads/enchant/1.6.0/enchant-1.6.0.tar.gz
# http://downloads.sourceforge.net/libexif/libexif-0.6.21.tar.bz2
# http://downloads.sourceforge.net/openjpeg.mirror/openjpeg-2.1.0.tar.gz
# http://www.php.net/distributions/php-5.6.6.tar.xz
# http://ftp.debian.org/debian/pool/main/w/whois/whois_5.2.7.tar.xz
# http://downloads.sourceforge.net/tripwire/tripwire-2.4.2.2-src.tar.bz2
# http://www.sudo.ws/sudo/dist/sudo-1.8.12.tar.gz

	
		
	*) pressanykey; startpt= ;;
esac
popd
