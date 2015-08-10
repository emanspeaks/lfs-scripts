sed -i -e '/test-bison/d' tests/Makefile.in
try source $lfsroot/sysbuild/generic.sh 
ln -sv flex /usr/bin/lex