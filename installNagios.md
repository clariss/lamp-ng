## Install Nagios3 ##

---

Install Nagios 3 package:
```
apt-get -y install nagios3
```
The installation will require some user input. Enter a s follows:
  1. lamp-ng (Nagios admin password)
  1. lamp-ng (password confirmation)
  1. WORKGROUP (or your network domain)

Finalize the installation:
```
apt-get install nagios-nrpe-plugin
apt-get install ndoutils-nagios3-mysql
```

Configuring ndoutils-nagios3-mysql answers:
  1. YES
  1. lamp-ng (or the MySQL root password)
  1. lamp-ng (ndoutils Db password)
  1. lamp-ng (confirm password)

## Install exfoliation Nagios skin ##

---

The following is optional, but will install a quite nice skin for nagios3.
  1. back up some of Nagios3 files:
```
mv /usr/share/nagios3/htdocs/images /usr/share/nagios3/htdocs/images-orig
mv /etc/nagios3/stylesheets /etc/nagios3/stylesheets-orig
```
  1. download and uncompress skin:
```
cd /tmp
wget http://lancet.mit.edu/mwall/projects/nagios/exfoliation-0.7.tgz
tar xvfz /tmp/exfoliation-0.7.tgz
```
  1. install skin:
```
mv stylesheets /etc/nagios3
mv images /usr/share/nagios3/htdocs
```
  1. fix skin installation bug:
```
cd /usr/share/nagios3/htdocs/images/logos
mkdir base
cp debian.png base
```

## Verify Nagios configuration file (nagios.cfg) ##

---

```
/usr/sbin/nagios3 -v /etc/nagios3/nagios.cfg
```