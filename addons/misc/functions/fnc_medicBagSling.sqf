#include "script_component.hpp"

params [
	"_unit",
	"_object",
	"_bagPos"
];

_unit setVariable [QGVAR(hasMedicBagSlinged), true, true];

_object setVariable [QGVAR(isMedBagDown), false, true];
_object setVariable [QACEGVAR(dragging,canDrag), false, true];
_object setVariable [QACEGVAR(dragging,canCarry), false, true];
_object setVariable [QGVAR(slingPerson), _unit, true];

if(_bagPos == 0) then {
	//Put medbag on chest
	_object attachTo [_unit,[-0.3,0.1,-0.6],"pelvis",true];  
	_object setVectorDirandUp [[0,2,0],[0,0,1]];
	[_object, [0,33,0]] call BIS_fnc_setObjectRotation;

	Medicbagsling = "Medic_Bag_Sling" createVehicle position _unit;
	MedicBagsling attachTo [_unit,[-0.035,0.22,-0.01],"pelvis",true];  
	MedicBagsling setVectorDirandUp [[0,2,0],[0,0,1]]; 
	[MedicBagsling, [0,-58,0]] call BIS_fnc_setObjectRotation;

} else {
	//Put medbag on back
	_object attachTo [_unit,[0.21,-0.15,-0.6],"pelvis",true];  
	_object setVectorDirandUp [[0,2,0],[0,0,1]]; 
	[_object, [180,33,0]] call BIS_fnc_setObjectRotation;

	Medicbagsling = "Medic_Bag_Sling" createVehicle position _unit;
	MedicBagsling attachTo [_unit,[0,-0.22,-0.11],"pelvis",true];  
	MedicBagsling setVectorDirandUp [[0,2,0],[0,0,1]]; 
	[MedicBagsling, [180,-55,0]] call BIS_fnc_setObjectRotation;
};

_action = ["UNSLINGMEDBAG", LLSTRING(Medic_Bag_Sling_off), QPATHTOF(ui\MedicBagSling.paa), {
	params ["_target", "_player","_params"];
	_params params ["_object"];
	[_player, _object] call FUNC(medicBagPutDown);
},{true},{},[_object]] call ACEFUNC(interact_menu,createAction);
[_unit,1,["ACE_SelfActions","ACE_Equipment"], _action] call ACEFUNC(interact_menu,addActionToObject);

