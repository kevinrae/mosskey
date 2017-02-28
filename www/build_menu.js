function init() {
  $('a.character').click( addCharacterToSelectedPanel );
  $(document).on('click', '#selected_characters a.remove_character', removeCharacter)
}

function displayresults() {
/* http://stackoverflow.com/questions/6051586/best-way-to-take-the-content-from-an-li-tag-and-copy-it-elsewhere
*/
  var txt = "You selected these KeyCharacter ids:";
  $('li.selected').each(function(i) {
    txt += " " + $(this).clone().data("selected-id");
  });
  $('#results').text(txt); //overwrites p on every run.
}

function addCharacterToSelectedPanel() {
  var txtalrt = '';
  console.log(this);
  var id = $(this).data('id');
  var name = $(this).text();
  if ($('#selected_characters li').find("[data-selected-id='"+id+"']" ).length) {  
    txtalrt += 'You already selected ' + name;
    txtalrt += ' and you only need to pick it once.  Please pick something else.'; 
    alert(txtalrt);
  } else {
    $('#selected_characters').prepend('<li class="selected" data-selected-id="'+id+'">'+name+'<a class="remove_character" data-selected-id="'+id+'" href="#"> [X]</a></li>');
  }
  displayresults();
}

function removeCharacter() {
    $(this).parent().remove();
}

function parsetree(data) {
/* Parsetree is invoked via callback from the php script used for making the
   sql query to the db.  It builds the dynamic dropdown menus (& submenus) 
   using bootstrap components.  Contains a nested function for closing <li> 
   & <ul> tags.  Also... this parses jsonp data where each row has this
   format:
     id, name, lft, rht, depth
   lft, rht values define a tree structure.  reverse preorder tree traversal 
   algorithm is used to navigate thru the tree and build the dropdowns.
   
   If/when debugging, it is useful to output lft, rht, depth values and/or 
   review the console.log  */

  var row, txt = "";
//  var depth;
  var stack = [];
  txt += '<ul class="dropdown-menu">';

  /// nested function//////////////////////////////////////////
  // the last (rightmost) child of a parent will have:
  // child.rht + 1 = parent.rht
  // these denote the last list entry for the ul, and therefore
  // we need to close tags 
  function close_tags_for_last_child_in_tree(stack, rht) {
    var parentrht = stack.pop();
    if (parentrht - rht == 1) {           // last child in tree 
      txt += '</ul></li>';                // close tags
      close_tags_for_last_child_in_tree(stack, parentrht);
    } else { 
      stack.push(parentrht);
    }
  } //////////////////////////////////////////////////////////

  for (row in data) {
    console.log(data[row]);
    if (data[row].rht - data[row].lft > 1) { // parent test
      txt += '<li class="dropdown-submenu">';
        txt += '<a href="#">';
//      txt += '<a class="character" data-id="' + data[row].id; 
//      txt += ' name="' + data[row].name + '">';
      txt += data[row].name;
//      txt += ' data-id: '+ data[row].id;
//      txt += ' lft: '+ data[row].lft;
//      txt += ' rht: '+ data[row].rht;
//      txt += ' depth: '+ data[row].depth;
      txt += '</a>'; 
      txt += '<ul class="dropdown-menu">';
      stack.push(data[row].rht); // store rht in stack for parents
      } else { // this is a leaf node 
      txt += '<li><a class="character" data-id="' + data[row].id; 
      txt += '" href="#"';
      txt += ' name="' + data[row].name + '">';
      txt += data[row].name;
//      txt += ' data-id: '+ data[row].id;
//      txt += ' lft: '+ data[row].lft;
//      txt += ' rht: '+ data[row].rht;
//      txt += ' depth: '+ data[row].depth;
      txt += '</a></li>'; 

      close_tags_for_last_child_in_tree(stack, data[row].rht);
    }
  }  
  txt += '</ul>';
  $('#dynamic_menu_button').after(txt);
}

//http://stackoverflow.com/questions/6692538/generate-unordered-list-from-json-data
//http://stackoverflow.com/questions/11128700/create-a-ul-and-fill-it-based-on-a-passed-array

//cannot add onclick attribute to href here and expect this variable to get properly scoped
