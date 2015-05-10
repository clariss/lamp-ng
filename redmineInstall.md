## REDMINE Installation h0wt0 ##

---


1- Install main packages in sequence as shown below:
```
apt-get install redmine-mysql
apt-get install redmine
```
The installation of Redmine will request some user input.
These are the answers for the screens _Configuring Redmine_:
  1. YES
  1. mysql
  1. lamp-ng (or password defined for mySQL root user)
  1. lamp-ng (or another password of choice)

2- Fix a Redmine installation bug in the vendor.rb file:
```
vi /usr/lib/ruby/1.8/active_support/vendor.rb
```
change the following:
```
gem 'i18n', '>= 0.1.3'
```
to:
```
gem 'i18n', '>= 0.1.3', '< 0.4.0'
```

3- Finish installation
```
apt-get install libapache2-mod-passenger
ln -s /usr/share/redmine/public /var/www/redmine
chown -R www-data:www-data /var/www/redmine
echo "RailsBaseURI /redmine" > /etc/apache2/sites-available/redmine
a2ensite redmine
/etc/init.d/apache2 reload
/etc/init.d/apache2 restart
cp /usr/share/doc/redmine/examples/email.yml.example /etc/redmine/default/email.yml
```

4- Access Redmine in a web browser. URL should be:
```
http://<host IP>/redmine
```

For Example
```
http://192.168.0.90/redmine
```