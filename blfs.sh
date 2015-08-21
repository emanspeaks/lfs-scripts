install -m 755 $lfsroot/blfs/templates/bashrc /etc/
install -m 755 $lfsroot/sysconfig/templates/profile /etc/
install --directory --mode=0755 --owner=root --group=root /etc/profile.d
install -m 755 $lfsroot/blfs/templates/profile.d/* /etc/profile.d/
install --directory --mode=0755 --owner=root --group=root /etc/skel
install -m 755 $lfsroot/blfs/templates/skel/* /etc/skel/
dircolors -p > /etc/dircolors
clear > /etc/issue