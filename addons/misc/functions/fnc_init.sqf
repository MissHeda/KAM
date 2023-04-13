#include "script_component.hpp"
/*
 * Author: Katalam
 * Initializes unit variables.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call kat_misc_fnc_init;
 *
 * Public: No
 */

params ["_unit"];

_unit setVariable [QGVAR(itemsBackpack), [], true];

private _items = missionNamespace getVariable [QGVAR(WhitelistAllowedMedicItems), ""];
private _itemarray = [_items, "CfgWeapons", "CfgMagazines"] call FUNC(getList);

{	
	if !(_x in GVAR(DefaultAllowedMedicItems)) then {
		GVAR(DefaultAllowedMedicItems) pushback _x; 
	};
} forEach _itemarray;