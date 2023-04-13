#include "script_component.hpp"

params[
    ["_unit", objNull, [objNull]], 
    ["_item", "", [""]], 
    ["_object", "", [""]]
];

[_unit, 0, ["ACE_MainActions", "UNSLINGMEDBAG"]] call ace_interact_menu_fnc_removeActionFromObject;

_pos = getPosATL _unit;
_azimuth = getDir _unit;
_far = 1;
// distance from the player to the _object

_x = (_pos select 0) + (_far * (sin _azimuth));
_y = (_pos select 1) + (_far * (cos _azimuth));

_obj = createvehicle [_object, [_x, _y, (_pos select 2)], [], 0, 'CAN_COLLIDE'];
_obj enableSimulation true;
_obj setVariable [QGVAR(isMedBagDown), true, true];
_obj setVariable [QACEGVAR(dragging,canDrag), true, true];
_obj setVariable [QACEGVAR(dragging,canCarry), true, true];

if(_item != "") then {
    _unit removeItem _item;
};

true