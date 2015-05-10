fix MySQL ibdata1 default config, changing from 1 database file to 1 file per table.
```
vi /etc/mysql/my.cnf
```
add MySQL configuration so a tablespace file is created for each table. Find [mysqld](mysqld.md) in the file and add innodb\_file\_per\_table as below.
```
[mysqld]
innodb_file_per_table = 1
```
Restart MySQL server
```
/etc/init.d/mysql restart
```