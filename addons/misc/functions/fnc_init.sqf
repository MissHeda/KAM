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

params ["_unit", ["_isRespawn", true]];

if (!local _unit) exitWith {};

_unit setVariable [QGVAR(itemsBackpack), [], true];
_unit setVariable [QGVAR(isLeftArmFree), true, true];
_unit setVariable [QGVAR(isRightArmFree), true, true];
_unit setVariable [QGVAR(isLeftLegFree), true, true];
_unit setVariable [QGVAR(isRightLegFree), true, true];
_unit addEventHandler ["Put", LINKFUNC(checkOnlyMedicItems)];
_unit addEventHandler ["InventoryOpened", LINKFUNC(openInventory)];

private _items = missionNamespace getVariable [QGVAR(WhitelistAllowedMedicItems), ""];
private _itemarray = [_items, "CfgWeapons", "CfgMagazines"] call FUNC(getList);

{	
	if !(_x in GVAR(DefaultAllowedMedicItems)) then {
		GVAR(DefaultAllowedMedicItems) pushback _x; 
	};
} forEach _itemarray;

private _str = missionNamespace getVariable [QGVAR(armbandSlingLeftArm), ""];
private _array = [_str] call FUNC(getVariableList);
_unit setVariable [QGVAR(armbandSlingLeftArmPos), _array, true];

private _str = missionNamespace getVariable [QGVAR(armbandSlingRightArm), ""];
private _array = [_str] call FUNC(getVariableList);
_unit setVariable [QGVAR(armbandSlingRightArmPos), _array, true];

private _str = missionNamespace getVariable [QGVAR(armbandSlingLeftLeg), ""];
private _array = [_str] call FUNC(getVariableList);
_unit setVariable [QGVAR(armbandSlingLeftLegPos), _array, true];

private _str = missionNamespace getVariable [QGVAR(armbandSlingRightLeg), ""];
private _array = [_str] call FUNC(getVariableList);
_unit setVariable [QGVAR(armbandSlingRightLegPos), _array, true];