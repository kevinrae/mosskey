# Moss Key
Multiple entry key for North American Mosses

Prototype of moss identification key.

Go here for app:  www

Schema Diagram: (https://docs.google.com/drawings/d/1hsYuWH6XhbKBrbOBh2Q-OVCEWxAa-OF5mJIrrtirZ84/edit)

Database schema created in MySQLWorkbench.  See (https://github.com/kevinrae/mosskey/bootstrap-3.3.6/docs/app/identificationkey/mosskey_db_backup.sql) for current backup.

Requirements:
 * bootstrap 3.3.6+
 * node 4.4.7
 * mysql 5.7
 
## Notes / To Do List
See Issues (https://github.com/kevinrae/mosskey/issues) tab on github


## How to startup application
```
sudo /usr/local/mysql/support-files/mysql.server start
chrome localhost
```

## How to backup & restore mysql db
```
mysqldump -u root -p --databases mosskey > mosskey_new_schema_v1_jan_16_2018.sql
mysql -u root -p --database mosskey < mosskey_new_schema_v1_jan_16_2018.sql
```
