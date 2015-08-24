sed \
  -e /xmlInitializeCatalog/d \
  -e 's/((ent->checked =.*&&/(((ent->checked == 0) ||\
          ((ent->children == NULL) \&\& (ctxt->options \& XML_PARSE_NOENT))) \&\&/' \
  -i parser.c
try ./configure --prefix=/usr --disable-static --with-history --with-python=/usr/bin/python3
try make
try wget http://www.w3.org/XML/Test/xmlts20130923.tar.gz 
try tar -xvf xmlts20130923.tar.gz
make check > ../check.log
grep -E '^Total|expected' ../check.log
echo 'check the results above'
pressanykey
rm -vf ../check.log
try make install