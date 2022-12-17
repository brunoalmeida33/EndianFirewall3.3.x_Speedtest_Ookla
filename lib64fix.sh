#!/bin/bash

#prepara lib64
if [ -f /lib64/ld-linux-x86-64.so.2 ]; then
echo &>/dev/null
else
mkdir /lib64
ln -s /lib/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2
fi

#load libs
/sbin/ldconfig 2>/dev/null
