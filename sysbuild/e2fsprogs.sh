sed -e '/int.*old_desc_blocks/s/int/blk64_t/' \
    -e '/if (old_desc_blocks/s/super->s_first_meta_bg/desc_blocks/' \
    -i lib/ext2fs/closefs.c

try mkdir -v build
cd build
try LIBS=-L/tools/lib                    \
CFLAGS=-I/tools/include              \
PKG_CONFIG_PATH=/tools/lib/pkgconfig \
../configure --prefix=/usr           \
             --bindir=/bin           \
             --with-root-prefix=""   \
             --enable-elf-shlibs     \
             --disable-libblkid      \
             --disable-libuuid       \
             --disable-uuidd         \
             --disable-fsck
try make
try ln -sfv /tools/lib/lib{blk,uu}id.so.1 lib
try make LD_LIBRARY_PATH=/tools/lib check
try make install
try make install-libs
try chmod -v u+w /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a
try gunzip -v /usr/share/info/libext2fs.info.gz
try install-info --dir-file=/usr/share/info/dir /usr/share/info/libext2fs.info
try makeinfo -o      doc/com_err.info ../lib/et/com_err.texinfo
try install -v -m644 doc/com_err.info /usr/share/info
try install-info --dir-file=/usr/share/info/dir /usr/share/info/com_err.info

cd ..