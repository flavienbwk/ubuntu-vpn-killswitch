#!/bin/bash

if [ "$EUID" -ne 0 ]
    then echo "Please run as root (sudo)"
    exit 1
fi

ufw reset
ufw default deny incoming
ufw default deny outgoing
ufw allow out on tun0 from any to any
ufw enable
