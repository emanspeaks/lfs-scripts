sed "s:ruby-1.9:ruby-2.2:g" -i configure
try source $lfsroot/blfs/generic.sh
try ln -v -s /usr/share/graphviz/doc \
         /usr/share/doc/graphviz-2.38.0