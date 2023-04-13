#include "script_component.hpp"

params ["_unit", "_obj", "_item"];

private _targetItems = itemCargo _obj;
private _targetMagazines = magazineCargo _obj;

if(count _targetItems > 0 || count _targetMagazines > 0) then {

	[LLSTRING(denyMedicBagPickUp), 2, _unit] call ACEFUNC(common,displayTextStructured); 

} else {

	if(_unit canAddItemToBackpack [_item, 1]) then {
		_unit addItemToBackpack _item;
		deleteVehicle _obj;
		_return = true;
	}else{
		_return = false;
	};
};
true
