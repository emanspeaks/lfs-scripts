#!/bin/bash
#this script assumes you are CHROOTED and running as user ROOT

if [ -z $includedalready ]
then
	pushd `dirname $0` > /dev/null; mypath=`pwd`; popd > /dev/null
	lfsroot=$mypath #unique to main5.sh since it's top-level
	export lfsstage=sysbuild
	logpath=$lfsroot/logs/$lfsstage
  source $lfsroot/include/include.sh
fi

wrap=$lfsroot/include/wrapper.sh
startpt=$1

if [ -z $startpt ]
then
	startpt=1
fi

pushd $lfsroot/sysbuild
case $startpt in
	1) ptry $wrap bc-1.06.95.tar.bz2 bc.sh ;&
	2) ptry $wrap libtool-2.4.6.tar.xz libtool.sh ;&
	3) ptry $wrap gdbm-1.11.tar.gz generic.sh --enable-libgdbm-compat ;&
	4) ptry $wrap expat-2.1.0.tar.gz expat.sh ;&
	5) ptry $wrap inetutils-1.9.2.tar.gz inetutils.sh \
						--localstatedir=/var   \
            --disable-logger       \
            --disable-whois        \
            --disable-servers ;&
	6) ptry $wrap perl-5.20.2.tar.bz2 perl.sh ;&
	7) ptry $wrap XML-Parser-2.44.tar.gz XML-Parser.sh ;&
	8) ptry $wrap autoconf-2.69.tar.xz autoconf.sh ;&
	9) ptry $wrap automake-1.15.tar.xz automake.sh ;&
	10) ptry $wrap diffutils-3.3.tar.xz diffutils.sh ;&
	11) ptry $wrap gawk-4.1.1.tar.xz gawk.sh ;&
	12) ptry $wrap findutils-4.4.2.tar.gz findutils.sh \
		--localstatedir=/var/lib/locate ;&
	13) ptry $wrap gettext-0.19.4.tar.xz generic.sh \
		--docdir=/usr/share/doc/gettext-0.19.4 ;&
	14) ptry $wrap intltool-0.50.2.tar.gz intltool.sh ;&
	15) ptry $wrap gperf-3.0.4.tar.gz generic.sh \
		--docdir=/usr/share/doc/gperf-3.0.4 ;&
	16) ptry $wrap groff-1.22.3.tar.gz groff.sh ;&
	17) ptry $wrap xz-5.2.0.tar.xz xz.sh \
		--docdir=/usr/share/doc/xz-5.2.0 ;&
	18) ptry $wrap grub-2.02~beta2.tar.xz grub.sh ;&
	19) ptry $wrap less-458.tar.gz less.sh ;&
	20) ptry $wrap gzip-1.6.tar.xz gzip.sh --bindir=/bin ;&
	21) ptry $wrap iproute2-3.19.0.tar.xz iproute2.sh ;&
	22) ptry $wrap kbd-2.0.2.tar.gz kbd.sh ;&
	23) ptry $wrap kmod-19.tar.xz kmod.sh \
						--bindir=/bin          \
            --sysconfdir=/etc      \
            --with-rootlibdir=/lib \
            --with-xz              \
            --with-zlib ;&
	24) ptry $wrap libpipeline-1.4.0.tar.gz libpipeline.sh ;&
	25) ptry $wrap make-4.1.tar.bz2 generic.sh ;&
	26) ptry $wrap patch-2.7.4.tar.xz generic.sh ;&
	27) ptry $wrap sysklogd-1.5.1.tar.gz sysklogd.sh ;&
	28) ptry $wrap sysvinit-2.88dsf.tar.bz2 sysvinit.sh ;&
	29) ptry $wrap tar-1.28.tar.xz tar.sh ;&
	30) ptry $wrap texinfo-5.2.tar.xz texinfo.sh ;&
	31) ptry $wrap eudev-2.1.1.tar.gz eudev.sh ;&
	32) ptry $wrap util-linux-2.26.tar.xz util-linux.sh ;&
	33) ptry $wrap man-db-2.7.1.tar.xz generic.sh \
						--docdir=/usr/share/doc/man-db-2.7.1 \
            --sysconfdir=/etc                      \
            --disable-setuid                       \
            --with-browser=/usr/bin/lynx           \
            --with-vgrind=/usr/bin/vgrind          \
            --with-grap=/usr/bin/grap ;&
	34) ptry $wrap vim-7.4.tar.bz2 vim.sh ;&
	
	35) try rm -rf /tmp/* ;&
		
	*) pressanykey; startpt= ;;
esac
popd