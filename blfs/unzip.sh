case `uname -m` in
  i?86)
    sed -i -e 's/DASM_CRC"/DASM_CRC -DNO_LCHMOD"/' unix/Makefile
    try make -f unix/Makefile linux
    ;;
  *)
    sed -i -e 's/CFLAGS="-O -Wall/& -DNO_LCHMOD/' unix/Makefile
    try make -f unix/Makefile linux_noasm
    ;;
esac
try make check
try make prefix=/usr MANDIR=/usr/share/man/man1 install