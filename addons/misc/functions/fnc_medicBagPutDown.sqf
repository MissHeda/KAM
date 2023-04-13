#include "script_component.hpp"

params ["_unit", "_obj"];

_unit setVariable[QGVAR(hasMedicBagSlinged), false, true];
[_unit, 1, ["ACE_SelfActions", "ACE_Equipment" , "UNSLINGMEDBAG"]] call ace_interact_menu_fnc_removeActionFromObject;

_pos = getPosATL _unit;
_azimuth = getDir _unit;
_far = 1;

_x = (_pos select 0) + (_far * (sin _azimuth));
_y = (_pos select 1) + (_far * (cos _azimuth));

detach _obj;
_obj setVectorDirandUp [[0,1,0],[0,0,1]]; 
[_obj, [0,0,0]] call BIS_fnc_setObjectRotation;
_obj setPos [_x, _y, (_pos select 2)];
_obj setVariable [QGVAR(isMedBagDown), true, true];
_obj setVariable [QACEGVAR(dragging,canDrag), true, true];
_obj setVariable [QACEGVAR(dragging,canCarry), true, true];
_obj setVariable [QGVAR(hasMedicBagSlinged), false, true];

_slingUnitCall = _obj getVariable [QGVAR(slingPerson), objNull];
[_slingUnitCall, 1, ["ACE_SelfActions", "ACE_Equipment" , "UNSLINGMEDBAG"]] call ace_interact_menu_fnc_removeActionFromObject;
_slingUnitCall setVariable[QGVAR(hasMedicBagSlinged), false, true];