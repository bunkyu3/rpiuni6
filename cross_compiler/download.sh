#!/bin/bash
# download.sh

set -e

BINUTILS_VERSION=binutils-2.25
GCC_VERSION=gcc-5.2.0
GMP_VERSION=gmp-6.1.2
MPFR_VERSION=mpfr-4.0.2
MPC_VERSION=mpc-1.1.0

wget -nc http://ftpmirror.gnu.org/binutils/${BINUTILS_VERSION}.tar.gz
wget -nc http://ftpmirror.gnu.org/gcc/${GCC_VERSION}/${GCC_VERSION}.tar.gz
wget -nc ftp://ftp.gnu.org/gnu/gmp/${GMP_VERSION}.tar.xz
wget -nc https://www.mpfr.org/mpfr-current/${MPFR_VERSION}.tar.xz
wget -nc https://ftp.gnu.org/gnu/mpc/${MPC_VERSION}.tar.gz

for i in *.tar.gz;do tar -zxvf $i;done
for i in *.tar.xz;do tar -Jxvf $i;done

mv ${GMP_VERSION} ${GCC_VERSION}/gmp
mv ${MPFR_VERSION} ${GCC_VERSION}/mpfr
mv ${MPC_VERSION} ${GCC_VERSION}/mpc

echo "download success!"

