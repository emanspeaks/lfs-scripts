try mkdir build
cd  build
try cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .. 
try make
try make install
cd ../doc
for man in man/man?/* ; do
    try install -v -D -m 644 $man /usr/share/$man
done
cd ..