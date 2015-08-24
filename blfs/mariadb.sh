try groupadd -g 40 mysql &&
try useradd -c "MySQL Server" -d /srv/mysql -g mysql -s /bin/false -u 40 mysql
sed -i "s@data/test@\${INSTALL_MYSQLTESTDIR}@g"        sql/CMakeLists.txt       
sed -i "s/srv_buf_size/srv_sort_buf_size/"      storage/innobase/row/row0log.cc
try mkdir build
cd build 
try cmake -DCMAKE_BUILD_TYPE=Release                       \
      -DCMAKE_INSTALL_PREFIX=/usr                      \
      -DINSTALL_DOCDIR=share/doc/mariadb-10.0.16       \
      -DINSTALL_DOCREADMEDIR=share/doc/mariadb-10.0.16 \
      -DINSTALL_MANDIR=share/man                       \
      -DINSTALL_MYSQLSHAREDIR=share/mysql              \
      -DINSTALL_MYSQLTESTDIR=share/mysql/test          \
      -DINSTALL_PLUGINDIR=lib/mysql/plugin             \
      -DINSTALL_SBINDIR=sbin                           \
      -DINSTALL_SCRIPTDIR=bin                          \
      -DINSTALL_SQLBENCHDIR=share/mysql/bench          \
      -DINSTALL_SUPPORTFILESDIR=share/mysql            \
      -DMYSQL_DATADIR=/srv/mysql                       \
      -DMYSQL_UNIX_ADDR=/run/mysqld/mysqld.sock        \
      -DWITH_EXTRA_CHARSETS=complex                    \
      -DWITH_EMBEDDED_SERVER=ON                        \
      -DTOKUDB_OK=0                                    \
      .. 
try make
try make test
try make install

try install -v -dm 755 /etc/mysql
try install -v -m644 $lfsroot/blfs/templates/my.cnf /etc/mysql/
try mysql_install_db --basedir=/usr --datadir=/srv/mysql --user=mysql &&
try chown -R mysql:mysql /srv/mysql
try install -v -m755 -o mysql -g mysql -d /run/mysqld
mysqld_safe --user=mysql 2>&1 >/dev/null &

pressanykey
mysqladmin -u root password

mysqladmin -p shutdown

pushd $bootscripts
try make install-mysql
popd