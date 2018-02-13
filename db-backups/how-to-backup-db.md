## How to backup mysql db
```
cd PROJECT_ROOT_DIR/db-backups
mysqldump -u root -p --databases mosskey > mosskey_new_schema_v1_jan_16_2018.sql
```

## Restore
```
cd PROJECT_ROOT_DIR/db-backups
mysql -u root -p --database mosskey < mosskey_new_schema_v1_jan_16_2018.sql
```

## Import data from Google Sheets into MySQL
From Google Sheets (for each Tab [KeyCharacter / Taxa / Map]):
* File -> Download As -> Comma Separated Values (Current Sheet)
```
[tablename].csv
```

Clear DB tables:
```
mysql -u root -p --database mosskey < mosskey-import.sql
```

Start mysql client:
```
mysql -u root -p --database mosskey 
\W
load data local infile 'KeyCharacter-Generated.csv' into table KeyCharacter fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 lines (id, name, lft, rht, description, anchortext, urlid, iseye, ishandlens, isscope);
load data local infile 'Taxa-Generated.csv' into table Taxa fields terminated by ',' enclosed by '"' lines terminated by '\n' (id, name);
load data local infile 'Map-Generated.csv' into table Map fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 lines (taxaid, keycharacterid);
```
