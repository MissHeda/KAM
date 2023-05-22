#include "script_component.hpp"
/*
 * Author: Digii, Miss Heda
 * Adds a medic bag item to inventory if crate is empty.
 *
 * Arguments:
 * 0: Player
 * 1: Object
 * 2: String
 * 
 * Return Value:
 * bool
 *
 * Example:
 * [player, cursorTarget, "Medic_Bag"] call kat_misc_fnc_medicBagPickUp;
 *
 * Public: No
 */

params ["_unit", "_obj", "_item"];

private _targetItems = itemCargo _obj;
private _targetMagazines = magazineCargo _obj;

if(count _targetItems > 0 || count _targetMagazines > 0) then {

    [LLSTRING(denyMedicBagPickUp), 2, _unit] call ACEFUNC(common,displayTextStructured);
    _return = false;

} else {

    [_unit, _item] call ACEFUNC(common,addToInventory);
    deleteVehicle _obj;
    _return = true;
};
true
