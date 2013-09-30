#!/bin/sh
if [ ! -e /swap.ex ]; then
    dd if=/dev/zero of=/swap.ex bs=1M count=4096
    mkswap /swap.ex
    swapon /swap.ex
    echo "/swap.ex swap swap defaults 0 0" >> /etc/fstab
else
    echo "/swap.ex already exists."
fi
