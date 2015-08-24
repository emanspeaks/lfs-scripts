sed -i 's/ZLIBDIR=src/ZLIBDIR=$includedir/' configure.ac configure
try rm -vrf expat freetype lcms2 jpeg libpng zlib
try source $lfsroot/blfs/generic.sh
try ln -sfv ../ghostscript/9.15/doc /usr/share/doc/ghostscript-9.15

try tar -xvf ../ghostscript-fonts-std-8.11.tar.gz -C /usr/share/ghostscript --no-same-owner
try tar -xvf ../gnu-gs-fonts-other-6.0.tar.gz -C /usr/share/ghostscript --no-same-owner