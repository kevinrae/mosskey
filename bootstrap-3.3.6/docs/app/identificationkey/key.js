function init() {
  $('a.character').click( addCharacter );
}

//body > div.character-panel > div > div.panel-body > div > ul > li
///html/body/div[2]/div/div[2]/div/ul
//body > div.character-panel > div > div.panel-body > div > ul

function addCharacter() {
  var CharacterName = $(this).prop('id');
//  alert(CharacterName);
  $('#character-panel-ul-id').prepend('<li>'+CharacterName+'</li>');
}
