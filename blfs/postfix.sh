groupadd -g 32 postfix &&
groupadd -g 33 postdrop &&
useradd -c "Postfix Daemon User" -d /var/spool/postfix -g postfix \
        -s /bin/false -u 32 postfix
try chown -v postfix:postfix /var/mail

sed -i 's/.\x08//g' README_FILES/*
CCARGS=''
AUXLIBS=''

make CCARGS="-DUSE_TLS -I/usr/include/openssl/                     \
             -DUSE_SASL_AUTH -DUSE_CYRUS_SASL -I/usr/include/sasl  \
						 -DHAS_MYSQL -I/usr/include/mysql" \
     AUXLIBS="-lssl -lcrypto -lsasl2 -lmysqlclient -lz -lm"        \
     makefiles
try make
try sh postfix-install -non-interactive \
   daemon_directory=/usr/lib/postfix \
   manpage_directory=/usr/share/man \
   html_directory=/usr/share/doc/postfix-3.0.0/html \
   readme_directory=/usr/share/doc/postfix-3.0.0/readme