function init() {
  $('a.character').click( addCharacter );
  $(document).on('click', '#character-panel-ul-id a.remove_character', function(){
    $(this).parent().remove();
  });
}

function addCharacter() {
  var CharacterName = $(this).prop('id');
  $('#character-panel-ul-id').prepend('<li id='+CharacterName+'>'+CharacterName+'<a class="remove_character" id='+CharacterName+' href="#">[X]</a></li>');
}

function removeCharacter() {
  var CharacterName = $(this).prop('id');
//  $("li[id=CharacterName]").remove();
  alert(CharacterName);
}
