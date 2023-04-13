#include "script_component.hpp"

params["_unit","_target"];

_pos = getpos _target; 
_posx = _pos select 0; 
_posy = _pos select 1; 

_items = _target getVariable [QGVAR(FieldAidStationObjects), []];

[{
	params["_items"];

	if (_target getVariable [QGVAR(UnbuildFieldAidStationIsCanceled), false]) exitWith {};
	deleteVehicle (_items select 3);

}, [_items], 3] call CBA_fnc_waitAndExecute;

[{
	params["_items"];

	if (_target getVariable [QGVAR(UnbuildFieldAidStationIsCanceled), false]) exitWith {};
	deleteVehicle (_items select 2);

}, [_items], 7.5] call CBA_fnc_waitAndExecute;

[{
	params["_items"];

	if (_target getVariable [QGVAR(UnbuildFieldAidStationIsCanceled), false]) exitWith {};
	deleteVehicle (_items select 1);

}, [_items], 10] call CBA_fnc_waitAndExecute;

[{
	params["_items"];

	if (_target getVariable [QGVAR(UnbuildFieldAidStationIsCanceled), false]) exitWith {};
	deleteVehicle (_items select 0);

}, [_items], 12] call CBA_fnc_waitAndExecute;

[15, [_unit, _target, _items], {
    params["_args"];
    _args params["_unit", "_target"];

    _target setVariable [QGVAR(FieldAidStationIsBuild), false, true];
	_target setVariable [QACEGVAR(medical,isMedicalFacility), false, true];
	_target setVariable [QACEGVAR(dragging,canDrag), true, true];
	_target setVariable [QACEGVAR(dragging,canCarry), true, true];
    [_unit, "", 1] call ace_common_fnc_doAnimation;

}, {
	// TO DO !!!  BTW. Lstring für abbauen noch machen.
    params["_args"];
    _args params["_unit", "_target", "_items"];

    _target setVariable [QGVAR(UnbuildFieldAidStationIsCanceled), true, true];
    // hint LLSTRING(FieldAidStationBuildFail);

	createVehicle (_items select 0);
	createVehicle (_items select 1);
	createVehicle (_items select 2);
	createVehicle (_items select 3);
    
    [_unit, "", 1] call ace_common_fnc_doAnimation;
}, LLSTRING(FieldAidStationProgressBar)] call ace_common_fnc_progressBar;

[_unit, "AinvPknlMstpSnonWnonDnon_medic4"] call ace_common_fnc_doAnimation;