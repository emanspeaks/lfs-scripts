sed -i 's:= @mkdir_p@:= /bin/mkdir -p:' po/Makefile.in.in
try source $lfsroot/sysbuild/generic.sh