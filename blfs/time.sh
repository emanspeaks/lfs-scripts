sed -i 's/$(ACLOCAL)//' Makefile.in
sed -i 's/lu", ptok ((UL) resp->ru.ru_maxrss)/ld", resp->ru.ru_maxrss/' time.c
try source $lfsroot/blfs/generic.sh