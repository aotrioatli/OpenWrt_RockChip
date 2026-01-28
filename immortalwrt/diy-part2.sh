#!/bin/bash
#
# Modify default IP
sed -i 's/192.168.1.1/192.168.11.1/g' package/base-files/files/bin/config_generate
sed -i "s/ImmortalWrt/OpenWrt/g" package/base-files/files/bin/config_generate

# Fix Rust build: disable LLVM CI download to avoid 404 errors
# This prevents 404 errors when Rust tries to download pre-built LLVM from CI servers
if [ -f "feeds/packages/lang/rust/Makefile" ]; then
    echo "Patching Rust Makefile to disable LLVM CI downloads..."
    
    # Add --set llvm.download-ci-llvm=false to the x.py dist command
    # This tells Rust to build LLVM locally instead of downloading pre-built binaries
    sed -i 's/\($(PYTHON) \.\/x\.py dist\)/\1 --set llvm.download-ci-llvm=false --set rust.download-ci-llvm=false/' \
        feeds/packages/lang/rust/Makefile
    
    echo "Rust Makefile patched successfully"
fi
