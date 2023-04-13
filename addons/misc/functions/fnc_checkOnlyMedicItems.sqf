#include "script_component.hpp"

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



























///[{
///
///	params ["_args", "_pfhID"];
///	_args params ["_unit", "_container"];
///
///	if (!(isnull (findDisplay 602))) then {
///		if (ctrlShown ((findDisplay 602) displayCtrl 640)) then {
///
///			systemChat "Nenn es wie du willst";
///			//Removes everything that is not whitelisted as a Medic Item and returns it if possible. 
///			private _playerItems = items _unit;
///			{
///				if !(_x in GVAR(DefaultAllowedMedicItems)) then {
///					[_container, _x] call CBA_fnc_removeItemCargo;
///					_unit addItem _x;
///				};
///			} foreach _playerItems;
///
///			private _playerMags = magazines _unit;
///			{
///				if !(_x in GVAR(DefaultAllowedMedicItems)) then {
///					[_container, _x, 1] call CBA_fnc_removeMagazineCargo;
///					_unit addMagazine [_x, 1];
///				};
///			} foreach _playerMags;
///
///			//Removes everything that is not allowed if somehow something slips
///			private _deleteNotAllowedItems = items _container;
///			{
///				if !(_x in GVAR(DefaultAllowedMedicItems)) then {
///					[_container, _x] call CBA_fnc_removeItemCargo;
///				};
///			} foreach _deleteNotAllowedItems;
///
///			private _deleteNotAllowedMags = items _container;
///			{
///				if !(_x in GVAR(DefaultAllowedMedicItems)) then {
///					[_container, _x] call CBA_fnc_removeMagazineCargo;
///				};
///			} foreach _deleteNotAllowedMags;
///
///		};
///	}else{
///		[_pfhID] call CBA_fnc_removePerFrameHandler;
///	};
///
///
///}, 0.5, [_unit, _container]] call CBA_fnc_addPerFrameHandler;
