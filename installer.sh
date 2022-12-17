#!/bin/bash
clear
OSVER=`cat /etc/release | grep "Endian Firewall Community release 3.[0-3].*"`

if [ -z "$OSVER" ]; then
echo " "
echo Sistema operacional incompativel!
exit 1
else
echo " "
echo SO `cat /etc/release` Compativel.
fi

case "$1" in
  install)
  
echo " "
echo Instalando o Ookla Speedtest - 4nsecurity.

cp usr/local/bin/speedtest /usr/local/bin/speedtest
chmod +x /usr/local/bin/speedtest

#prepara lib64
if [ -f /lib64/ld-linux-x86-64.so.2 ]; then
echo &>/dev/null
else
mkdir /lib64
ln -s /lib/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2
fi

#load libs
/sbin/ldconfig

echo " "
echo Ookla Speedtest - 4nsecurity instalado com sucesso

exit 
    
    ;;
  remove)
  
echo " "
rm /usr/local/bin/speedtest 2>/dev/null
if [ -f /usr/local/bin/speedtest ]; then
rm -f /usr/local/bin/speedtest
else
echo " "
echo "Pacote Ookla Speedtest Removido."
fi

    ;;

  *)
    echo " "
    echo $"Usage: $0 {install|remove}"
    echo " "
    exit 1
esac

exit $?
