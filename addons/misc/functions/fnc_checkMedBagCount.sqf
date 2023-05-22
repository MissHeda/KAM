#include "script_component.hpp"
/*
 * Author: Digii, Miss Heda
 * TO BE ADDED ! ! !    TODO
 *
 * Arguments:
 * 0: Player
 * 1: Object
 * 
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget] call kat_misc_fnc_checkMedBagCount;
 *
 * Public: No
 */

params ["_unit","_container"];

if(_unit getVariable [QGVAR(itemsBackpack), []] != (backpackItems _unit)) then {
	_unit setVariable [QGVAR(itemsBackpack), backpackItems _unit];
	
	private _countMedBag = 0;
	{
		if(_x == "Medic_Bag") then {
			systemChat str _x;
			_countMedBag = _countMedBag + 1;
		};
	} foreach (backpackItems _unit);

	if(_countMedBag > 1) then {
        for "_i" from 1 to _countMedBag -1 step 1 do {
             _unit removeItem "Medic_Bag";
        };
	};

    _unit setVariable [QGVAR(itemsBackpack), backpackItems _unit];
};