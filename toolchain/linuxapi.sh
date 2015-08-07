try make mrproper
try make INSTALL_HDR_PATH=dest headers_install
try cp -rv dest/include/* /tools/include