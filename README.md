# Moss Key
Multiple entry key for North American Mosses

Prototype of moss identification key.

Go here for app:  www

Requirements:
 * bootstrap 3.3.6+
 * node 4.4.7
 * mysql 5.7
 
 Database schema created in MySQLWorkbench.  See (https://github.com/kevinrae/mosskey/bootstrap-3.3.6/docs/app/identificationkey/mosskey_db_backup.sql) for current backup.

# Notes / To Do List
 * Both taxon rank & character navigation menus are stored within tree structures in the DB.  Modified preorder tree traversal algorithm is used to simplify SQL queries for working with this hiearachy model.
 * Plan to use fontawesome icons for character info drilldowns.
 * Need to cleanup git repo to remove extraneous files.
 * Add links to google schema diagram.
 * PHP will use prepared queries to get DB data.
