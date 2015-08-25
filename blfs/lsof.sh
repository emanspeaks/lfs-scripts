tar -xvf lsof_4.88_src.tar  &&
cd lsof_4.88_src           &&
./Configure -n linux       &&
make CFGL="-L./lib -ltirpc"
try install -v -m0755 -o root -g root lsof /usr/bin 
try install -v lsof.8 /usr/share/man/man8
cd ..