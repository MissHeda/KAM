#include "script_component.hpp"

params["_unit", "_target"];

_target say3D QGVAR(BagZip);

private _playerItems = items _unit;
{
	if (_x in GVAR(DefaultAllowedMedicItems)) then {
		if (_target canAdd _x) then {
			_target addItemCargoGlobal [_x, 1];
			_unit removeItem _x;
		};
	};

} foreach _playerItems;

private _playerMags = magazines _unit;
{
	if (_x in GVAR(DefaultAllowedMedicItems)) then {
		if (_target canAdd _x) then {
			_target addMagazineCargoGlobal [_x,1];
			_unit removeMagazine _x;
		};
	};

} foreach _playerMags;