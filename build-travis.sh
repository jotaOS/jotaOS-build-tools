#!/bin/sh

cd /root/jotaOS
PATH="$PATH:/root/opt/cross/bin" make -j$(nproc) && \
cp jotaOS.iso jotaOSxz.iso && \
xz jotaOSxz.iso && \
mv jotaOSxz.iso.xz jotaOS.iso.xz
