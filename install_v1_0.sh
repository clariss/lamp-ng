#!/bin/sh
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# LAMP-NG INSTALLATION SCRIPT
#  * Configures system time 
#  * Updates operating system  
#  * Installs all packages required by lamp-ng (grep ${txtred} to see packages)
#  * Configures syslog-ng centralized logging
#  * Sets up a PHP page as Apache's default
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# Copyright (C) 2011 Fabio Hofer 
# Date released: 25/09/2011
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by 
# the Free Software Foundation, either version 3 of the License, or
# any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# <http://www.gnu.org/licenses/>
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

txtrst=$(tput sgr0) # Text reset
txtred=$(tput setaf 1) # Red

dpkg-reconfigure tzdata

clear

echo "Installation script will now start"
echo "Installing LAMP-NG"
echo
echo "Today is $(date)"
echo
echo "${txtred}!!!!!!!!!!!!!!!!!!!!!!!! A T T E N T I O N !!!!!!!!!!!!!!!!!!!!!!!!${txtrst}"
echo "You will be asked to specify a new password for the MySQL root user"
echo "                Remember it, we will use it later"
echo "${txtred}!!!!!!!!!!!!!!!!!!!!!!!! A T T E N T I O N !!!!!!!!!!!!!!!!!!!!!!!!${txtrst}"
read -p "Press enter to continue"
clear
echo "${txtred}01/15 - Update system${txtrst}"
apt-get -y update
apt-get -y upgrade
clear

echo "${txtred}02/15 - Dreamplug requirements${txtrst}" 
apt-get -y install locales
update-locale
clear

echo "${txtred}03/15 - ssh${txtrst}"
apt-get -y install ssh
clear

echo "${txtred}04/15 - syslog-ng${txtrst}"
apt-get -y install syslog-ng
mv /etc/syslog-ng/syslog-ng.conf /etc/syslog-ng/syslog-ng.conf.original
wget -O /etc/syslog-ng/syslog-ng.conf http://lamp-ng.googlecode.com/svn/trunk/syslog-ng/syslog-ng.conf

/etc/init.d/syslog-ng start
clear

echo "${txtred}05/15 - sudo${txtrst}"
apt-get -y install sudo
clear

echo "${txtred}06/15 - Linux Standard Base${txtrst}"
apt-get -y lsb-release
clear

echo "${txtred}07/15 - dos2unix${txtrst}"
apt-get -y install tofrodos
apt-get -y install dos2unix
clear

echo "${txtred}08/15 - mail utilities${txtrst}"
apt-get -y install bsd-mailx
clear

echo "${txtred}09/15 - Apache web server${txtrst}"
apt-get -y install apache2
mv /var/www/index.html /var/www/index.html.original
mv /etc/apache2/httpd.conf /etc/apache2/httpd.conf.original
mv /etc/apache2/sites-available/default-ssl /etc/apache2/sites-available/default-ssl.original
mv /etc/apache2/sites-available/default /etc/apache2/sites-available/default.original
mv /etc/apache2/apache2.conf /etc/apache2/apache2.conf.original
wget -O /var/www/index.php http://lamp-ng.googlecode.com/svn/trunk/www/index.txt
wget -O /etc/apache2/httpd.conf http://lamp-ng.googlecode.com/svn/trunk/apache/httpd.conf
wget -O /etc/apache2/sites-available/default-ssl http://lamp-ng.googlecode.com/svn/trunk/apache/default-ssl
wget -O /etc/apache2/sites-available/default http://lamp-ng.googlecode.com/svn/trunk/apache/default
wget -O /etc/apache2/apache2.conf http://lamp-ng.googlecode.com/svn/trunk/apache/apache2.conf

clear

echo "${txtred}10/15 - PHP5${txtrst}"
apt-get -y install php5
clear

echo "${txtred}11/15 - PHP5 modules${txtrst}"
apt-get -y install php-pear
apt-get -y install php5-mysql
apt-get -y install php5-ldap
apt-get -y install php5-snmp
apt-get -y install php5-gd
clear

echo "${txtred}12/15 - MySQL-Server${txtrst}"
apt-get -y install mysql-server-5.0
clear

echo "${txtred}13/15 - RDTool${txtrst}"
apt-get -y install rrdtool
clear

echo "${txtred}14/15 - Perl modules${txtrst}"
apt-get -y install librrds-perl
apt-get -y install ibconfig-inifiles-perl
apt-get -y install libcrypt-des-perl
apt-get -y install libdigest-hmac-perl
apt-get -y install libdigest-sha1-perl
apt-get -y install libgd-gd2-perl
clear

echo "${txtred}15/15 - SNMP daemon${txtrst}"
#apt-get -y install snmp
#apt-get -y install snmpd
#apt-get -y install libnet-snmp-perl
#apt-get -y install libsnmp-perl
clear

echo "${txtred}FINISHING INSTALATION${txtrst}"
echo
echo
echo
echo "${txtred}Starting Apache${txtrst}"
/etc/init.d/apache2 restart
echo
echo
echo
echo "${txtred}Go to the IP address stated below (inet addr) to test Apache and PHP${txtrst}"
ifconfig | grep "inet addr" | grep "Bcast" | sed 's/^ *\(.*\) *$/\1/'
echo
echo
echo
echo "${txtred}Starting MySQL${txtrst}"
/etc/init.d/mysql restart
echo
echo
echo
echo "${txtred}this are the files generated by syslog-ng${txtrst}"
ls -l /var/log/*SYSLOG-NG.LOG
/etc/init.d/mysql restart
ls -l /var/log/*SYSLOG-NG.LOG
echo
echo
echo
echo
echo
echo "______________________________________________________________________"
echo "${txtred}___ INSTALATION COMPLETE - LAMP-NG IS READY - ENJOY IN MODERATION$ ___${txtrst}"
echo "______________________________________________________________________"
echo
echo
echo
echo
echo


