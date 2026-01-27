#!/bin/bash
#
# Modify default IP
sed -i 's/192.168.1.1/192.168.11.1/g' package/base-files/files/bin/config_generate
sed -i "s/ImmortalWrt/OpenWrt/g" package/base-files/files/bin/config_generate

# Fix Rust build: disable LLVM CI download to avoid 404 errors
# Patch the rust Makefile to create config.toml with download-ci-llvm = false
if [ -f "feeds/packages/lang/rust/Makefile" ]; then
    # Find the Host/Compile section and add config.toml creation before the build
    sed -i '/define Host\/Compile/,/endef/{
        /PYTHON.*x\.py build/i\
	echo "[llvm]" > $(HOST_BUILD_DIR)/config.toml; \\\
	echo "download-ci-llvm = false" >> $(HOST_BUILD_DIR)/config.toml; \\
    }' feeds/packages/lang/rust/Makefile
fi
