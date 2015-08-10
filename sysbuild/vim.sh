echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h
try ./configure --prefix=/usr
try make
#make -j1 test #skipping test since it dumps harmful garbage to screen
try make install
try ln -sv vim /usr/bin/vi
for L in  /usr/share/man/{,*/}man1/vim.1; do
    try ln -sv vim.1 $(dirname $L)/vi.1
done
try ln -sv ../vim/vim74/doc /usr/share/doc/vim-7.4

cat > /etc/vimrc << "EOF"
" Begin /etc/vimrc

set nocompatible
set backspace=2
syntax on
if (&term == "iterm") || (&term == "putty")
  set background=dark
endif

" End /etc/vimrc
EOF

