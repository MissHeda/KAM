#include "script_component.hpp"

params ["_unit", "_container"];


if (typeOf _container == "Medic_Bag_Crate") exitwith {
	if (GVAR(showMedicBagHint)) then {
		hint LLSTRING(removeItemsHint);
	};
	
	_container say3D QGVAR(BagZip);
};
