#!/bin/bash


if [ ! "$HOSTIP" ]; then
	echo You have to provide -e HOSTIP=IP
	exit
fi

cp /root/01-dreamcast.conf /etc/dnsmasq.d/
sed -i s/192.168.0.155/$HOSTIP/g /etc/dnsmasq.d/01-dreamcast.conf

/etc/init.d/dnsmasq start
