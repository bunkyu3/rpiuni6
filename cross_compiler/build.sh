#!/bin/bash
# download.sh

set -e

pass="パスワード"
PREFIX=/usr/local
TARGET=aarch64-elf
CONFIGURATION_OPTIONS="--disable-multilib --disable-nls"

BINUTILS_VERSION=binutils-2.25
GCC_VERSION=gcc-5.2.0

#Step 1. Binutils
cd $BINUTILS_VERSION
./configure --prefix=$PREFIX --target=$TARGET $CONFIGURATION_OPTIONS
make
echo $pass | sudo -S make install
cd ..

#Step 2. C Compilers
cd $GCC_VERSION
./configure --prefix=$PREFIX --target=$TARGET $CONFIGURATION_OPTIONS --enable-languages=c
make all-gcc
echo $pass | sudo -S make install-gcc

echo "Build Success!!"

