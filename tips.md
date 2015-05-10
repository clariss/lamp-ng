Changing Nagios host map icons:
```
vi /etc/nagios3/hosts.cfg
```
Add to each host:
```
statusmap_image                 debian.png
icon_image                      debian.png
```
Restart Nagios
```
/etc/init.d/nagios3 restart
```

Find files in Linux:
```
find . -name *centreon* 
find . | xargs grep centreon 
```

How To import icons/images into centreon
```
Go to:
Administration > Options > Media > Folder > Add
(write: logos in both fields)
Now you can upload your icons to it. Go to
Administration > Options > Media > Images > Add
You can chose up to 5 at a time and they should be stored in:
/usr/local/centreon/www/img/media/logos/cisco.gif
```

changing statusmap.cgi to nicer graphics
```
http://83.18.153.218/html/projects/installation_fnagios.html
```