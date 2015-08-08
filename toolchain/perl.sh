try sh Configure -des -Dprefix=/tools -Dlibs=-lm
try make
try cp -v perl cpan/podlators/pod2man /tools/bin
try mkdir -pv /tools/lib/perl5/5.20.2
try cp -Rv lib/* /tools/lib/perl5/5.20.2