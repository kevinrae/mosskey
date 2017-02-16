CREATE VIEW `menu_characteristic` AS
SELECT *, CONCAT(CharacterMenuGroup.CharacteristicMenuGroup,' ',
 characterisiticsubmenugroup.characteristicsubmenugroup,' ',characteristic.characteristic) 
 AS menu_characteristic_name FROM characteristicmenugroup, characteristicmenusubgroup, characteristic;