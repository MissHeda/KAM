#include "script_component.hpp"
/*
 * Author: Digii, Miss Heda
 * Checks if a item is in the allowed medical items array. If not it deletes it and replaces it.
 *
 * Arguments:
 * 0: Player
 * 1: Object
 * 2: String
 * 
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget, "kat_armband_doctor"] call kat_misc_fnc_checkOnlyMedicItems;
 *
 * Public: No
 */

params ["_unit", "_container", "_item"];

if (typeOf _container != "Medic_Bag_Crate") exitwith {};

if !(_item in GVAR(DefaultAllowedMedicItems)) then {
	
	private _weaponClass = _item call BIS_fnc_itemType;
	if (_weaponClass select 1 == "Vest") then {
		hint LLSTRING(ItemsRemovedVest);
	};
	
	if (_weaponClass select 1 == "Uniform") then {
		hint LLSTRING(ItemsRemovedUniform);
	};

	if (_weaponClass select 1 == "Backpack") then {
		hint LLSTRING(ItemsRemovedBackpack);
	};

	if (_weaponClass select 0 == "Weapon") then {
		hint LLSTRING(AttachmentsRemoved);
	};


	[_container, _item] call CBA_fnc_removeItemCargo;
	[_container, _item] call CBA_fnc_removeMagazineCargo;
	[_container, _item] call CBA_fnc_removeBackpackCargo;
	[_container, _item] call CBA_fnc_removeWeaponCargo; 

	if (_weaponClass select 1 == "Uniform") then {
		_unit forceAddUniform _item;
	} else {
		if (_weaponClass select 1 == "Vest") then {
			_unit addVest _item;
		} else {
			if (_weaponClass select 1 == "Backpack") then {
				_unit addBackpackGlobal _item;
			} else {
				if (_weaponClass select 0 == "Weapon") then {
					_unit addWeaponGlobal _item;
				} else {
					_unit addItem _item;
				};
			};
		}; 
	};
};
