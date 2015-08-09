try make mrproper
try make INSTALL_HDR_PATH=dest headers_install
find dest/include \( -name .install -o -name ..install.cmd \) -delete
try cp -rv dest/include/* /usr/include