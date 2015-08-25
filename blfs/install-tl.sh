echo "This installer is interactive.  When prompted, type I to install"
pressanykey

TEXLIVE_INSTALL_PREFIX=/opt/texlive ./install-tl

export TEXARCH=$(uname -m | sed -e 's/i.86/i386/' -e 's/$/-linux/') &&

cat >> /etc/profile.d/extrapaths.sh << EOF
pathappend /opt/texlive/2015/texmf-dist/doc/man  MANPATH
pathappend /opt/texlive/2015/texmf-dist/doc/info INFOPATH
pathappend /opt/texlive/2015/bin/$TEXARCH
EOF

unset TEXARCH