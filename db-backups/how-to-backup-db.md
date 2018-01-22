## How to backup & restore mysql db
```
cd PROJECT_ROOT_DIR/db-backups
mysqldump -u root -p --databases mosskey > mosskey_new_schema_v1_jan_16_2018.sql
mysql -u root -p --database mosskey < mosskey_new_schema_v1_jan_16_2018.sql
```
