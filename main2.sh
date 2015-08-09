#!/tools/bin/bash
#this script assumes you are running with CHROOT as user lfs:lfs

if [ -z $includedalready ]
then
	pushd `dirname $0` > /dev/null; mypath=`pwd`; popd > /dev/null
	lfsroot=$mypath #unique to main2.sh since it's top-level
	logpath=$lfsroot/logs
  source $lfsroot/include/include.sh
fi

try mkdir -pv /{bin,boot,etc/{opt,sysconfig},home,lib/firmware,mnt,opt}
try mkdir -pv /{media/cdrom,sbin,srv,var}
try install -dv -m 0750 /root
try install -dv -m 1777 /tmp /var/tmp
try mkdir -pv /usr/{,local/}{bin,include,lib,sbin,src}
try mkdir -pv /usr/{,local/}share/{color,dict,doc,info,locale,man}
try mkdir -v  /usr/{,local/}share/{misc,terminfo,zoneinfo}
try mkdir -v  /usr/libexec
try mkdir -pv /usr/{,local/}share/man/man{1..8}

case $(uname -m) in
 x86_64) try ln -sv lib /lib64
         try ln -sv lib /usr/lib64
         try ln -sv lib /usr/local/lib64 ;;
esac

try mkdir -v /var/{log,mail,spool}
try ln -sv /run /var/run
try ln -sv /run/lock /var/lock
try mkdir -pv /var/{opt,cache,lib/{color,misc,locate},local}

try ln -sv /tools/bin/{bash,cat,echo,pwd,stty} /bin
try ln -sv /tools/bin/perl /usr/bin
try ln -sv /tools/lib/libgcc_s.so{,.1} /usr/lib
try ln -sv /tools/lib/libstdc++.so{,.6} /usr/lib
sed 's/tools/usr/' /tools/lib/libstdc++.la > /usr/lib/libstdc++.la
try ln -sv bash /bin/sh

try ln -sv /proc/self/mounts /etc/mtab

cat > /etc/passwd << "EOF"
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/dev/null:/bin/false
daemon:x:6:6:Daemon User:/dev/null:/bin/false
messagebus:x:18:18:D-Bus Message Daemon User:/var/run/dbus:/bin/false
nobody:x:99:99:Unprivileged User:/dev/null:/bin/false
EOF

cat > /etc/group << "EOF"
root:x:0:
bin:x:1:daemon
sys:x:2:
kmem:x:3:
tape:x:4:
tty:x:5:
daemon:x:6:
floppy:x:7:
disk:x:8:
lp:x:9:
dialout:x:10:
audio:x:11:
video:x:12:
utmp:x:13:
usb:x:14:
cdrom:x:15:
adm:x:16:
messagebus:x:18:
systemd-journal:x:23:
input:x:24:
mail:x:34:
nogroup:x:99:
users:x:999:
EOF

try touch /var/log/{btmp,lastlog,wtmp}
try chgrp -v utmp /var/log/lastlog
try chmod -v 664  /var/log/lastlog
try chmod -v 600  /var/log/btmp