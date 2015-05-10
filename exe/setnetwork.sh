#!/bin/sh
mv /etc/network/interfaces /etc/network/interfaces.original
wget --no-check-certificate -O /etc/network/interfaces https://lamp-ng.svn.sourceforge.net/svnroot/lamp-ng/files/network/interfaces
/etc/init.d/networking restart
