#!/bin/sh
if [ $1 ]; then
  if [ ! -e /swap.ex ]; then
    dd if=/dev/zero of=/swap.ex bs=1M count=$1
    chmod 600 /swap.ex
    mkswap /swap.ex
    swapon /swap.ex
    echo "/swap.ex swap swap defaults 0 0" >> /etc/fstab
  else
    echo "/swap.ex already exists."
  fi
else
  echo "Usage : sh ./addswap.sh SWAPSIZE(MB)"
fi
