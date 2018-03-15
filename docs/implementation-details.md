# Implementation Details
The Moss Key is a simple web application but has several components which will be described in high level here.  Hopefully this will make it easier for others to understand the design and code decisions to aid in maintenance down the road.

## Architecture Components
```
        A            B            C             D        E         F
 [Web Browser] -> [apache] -> [javascript] -> [php] -> [sql] -> [mysql]
                              [jquery]
                              [bootstrap]  
```

### A - Web Browser
Chrome was used during development.  Other browser compatibility has not been tested.  Helpful debugging information for the app can be found in the chrome -> developer tools -> console.

### B - Http server
Apache web server provides a place to run the server-side executables that provide formatting, function, and run database queries.  The apache wwwroot should be set to ./www in the git repo.

### C - Display Logic & Formatting
HTML pages use bootstrap, jquery, and css templates for display logic and formatting.  The dropdown menu for character selection uses a [modified preorder tree traversal algorithm](http://mikehillyer.com/articles/managing-hierarchical-data-in-mysql/).  See parsetree function in build_menu.js.  Thus, **adding new characteristics to the key requires data updates for every row** in the KeyCharacter table for building the dropdown menus.  Fontawesome provides fancy icons.  Bootstrap helps with desktop vs. mobile and screen sizing issues.

### D - php
php scripts are used to wrap / escape / format read-only sql queries against the db.  This provides separation / security from the display formatting.

### E - sql
Parametrized sql is run from within the php files.  Results are usually wrapped in json.

## F - MySQL
Data is stored in MySQL across several tables.  Refer to the [Schema Diagram](https://github.com/kevinrae/mosskey/blob/DB-schema-documentation/docs/mosskey-db-schema-model.pdf) for specifics.  Initial schema was created using MySQL Workbench and we can highly recommend this useful tool.


## Design Considerations
### Open
Open source software was used throughout.  Minimizes cost.  Simplifies future support options.
### Standards
Used existing standards and popular frameworks where available.  Perfectly happy to not re-invent the wheel.
### Responsive
Initial discussions placed a high value on 'Responsive Design' and therefore the twitter bootstrap javascript framework was selected. 
### Documentation
Project goals call for support to be handed off from the initial development team to others at some point in the future.  As such, documentation was critical throughout the development process.  Code comments, schema diagrams, how to documents, backup instructions have been included to help jumpstart others to get familiar with the project. 
