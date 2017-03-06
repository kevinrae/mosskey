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
- [x]  Both taxon rank & character navigation menus are stored within tree structures in the DB.  Modified preorder tree traversal algorithm is used to simplify SQL queries for working with this hiearachy model.
- [x] Add links to google schema diagram.
- [x] PHP will be used to get DB data via sql and results will be returned via jsonp to be used as javascript objects
- [x] Plan to use fontawesome icons for character info drilldowns. used glyphicons from bootstrap instead.
- [x] Build taxa detail .php driven sql query
- [x] Taxa detail .js
- [ ] Need to cleanup git repo to remove extraneous files.
- [ ] Null handling logic for missing url, authority fields
- [ ] taxa description field containing special characters ();/'" causes issues for php handler and returns NULL for this column.
- [ ] URL type handling logic - images vs. links.
- [ ] taxa detail page needs more thought regarding format / content / layout
- [ ] clicking back from taxa detail page loses state of character selection in the nav.  
- [ ] Add list of matching keycharacters on taxa detail page.

