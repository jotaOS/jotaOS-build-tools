#!/bin/sh

apk update && \
apk upgrade && \
apk add --no-cache gcc g++ make wget nasm python3 cdrkit bison flex gmp-dev mpc1-dev mpfr-dev texinfo xorriso mtools xz && \
cd /root && \
mkdir -p opt/cross && \
mkdir xcompiler && \
cd xcompiler && \
wget https://ftp.gnu.org/gnu/binutils/binutils-2.34.tar.xz && \
wget https://ftp.gnu.org/gnu/gcc/gcc-10.1.0/gcc-10.1.0.tar.xz && \
tar xvf binutils-2.34.tar.xz && \
tar xvf gcc-10.1.0.tar.xz && \
cd binutils-2.34 && \
./configure --target=i686-elf --prefix="/root/opt/cross" --with-sysroot --disable-nls --disable-werror && \
make -j$(nproc) && \
make install && \
cd /root/xcompiler/gcc-10.1.0 && \
./configure --target=i686-elf --prefix="/root/opt/cross" --disable-nls --enable-languages=c++ --without-headers && \
make all-gcc -j$(nproc) && \
make install-gcc && \
rm -rf /root/xcompiler && \
apk del --no-cache gcc g++ wget bison flex gmp-dev mpfr-dev texinfo xorriso mtools && \
apk add --no-cache binutils
