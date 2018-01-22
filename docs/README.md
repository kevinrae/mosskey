# Implementation Details
The Moss Key is simple web application but it has several components which we will describe in high-level here.  Hopefully this will make it easier for others to understand the design and code decisions to add in maintenance down the road.

## Data
Data is stored in MySQL across several tables.  Refer to the [Schema Diagram](https://docs.google.com/drawings/d/1hsYuWH6XhbKBrbOBh2Q-OVCEWxAa-OF5mJIrrtirZ84/edit) for specifics.  Initial schema was created using MySQL Workbench and we can highly recommend this useful tool.


## Architecture Components
   A         B            C         D         E     F      G
 [User]>[Web Browser]>[Apache]>[javascript]>[php]>[sql]>[mysql]


## Dropdown Menu
The initial dropdown menu for character selectionuses a [modified preorder tree traversal algorithm](http://mikehillyer.com/articles/managing-hierarchical-data-in-mysql/).  Thus, adding new characteristics to the key requires updates to the entire tree for building the dropdown menus.

## Design Considerations
### Open
Open source software was used throughout.  Minimizes cost.  Simplifies future support options.
### Standards
Used existing standards and popular frameworks where available.  Perfectly happy to not re-invent the wheel.
### Responsive
Initial discussions placed a high value on 'Responsive Design' and therefore the twitter bootstrap javascript framework was selected. 
### Documentation
Project goals call for support to be handed off from the initial development team to others at some point in the future.  As such, documentation was critical throughout the development process.  Code comments, schema diagrams, how to documents, backup instructions have been included to help jumpstart others to get familiar with the project. 
