## Install PHPMyAdmin h0wt0 ##

---

Easy, 1 command will do this for you:
```
apt-get install phpmyadmin
```

Installation will require some user input. The answers are as follows:
  1. Configuring phpmyadmin: YES
  1. lamp-ng (or your MySQL root password)
  1. lamp-ng (choose a password for the admin user of phpmysql)
  1. lamp-ng (password confirmation)
  1. select the web server:
> `[*] apache2` <br />
> `[ ] lighttpd` <br />
> (Press space bar to select apache2, make sure lighttpd is not selected, then press enter)

Access PHPMyAdmin in a web browser. The URL should be:
```
http://<host ip>/phpmyadmin/
```

For example:
```
http://192.168.0.90/phpmyadmin/
```