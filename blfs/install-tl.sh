TEXLIVE_INSTALL_PREFIX=/opt/texlive ./install-tl

export TEXARCH=$(uname -m | sed -e 's/i.86/i386/' -e 's/$/-linux/') &&

cat >> /etc/profile.d/extrapaths.sh << EOF
pathappend /opt/texlive/2014/texmf-dist/doc/man  MANPATH
pathappend /opt/texlive/2014/texmf-dist/doc/info INFOPATH
pathappend /opt/texlive/2014/bin/$TEXARCH
EOF

unset TEXARCH