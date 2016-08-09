function init() {
  $('a.character').click( addCharacter );
  $(document).on('click', '#character-panel-ul-id a.remove_character', removeCharacter)
}

function addCharacter() {
  var CharacterName = $(this).prop('id');
  $('#character-panel-ul-id').prepend('<li id='+CharacterName+'>'+CharacterName+'<a class="remove_character" id='+CharacterName+' href="#">[X]</a></li>');
}

function removeCharacter() {
    $(this).parent().remove();
}
