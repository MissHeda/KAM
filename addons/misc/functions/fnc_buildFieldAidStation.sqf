#include "script_component.hpp"
/*
 * Author: Digii, Miss Heda
 * Builds a field aid station that is marked as a medical facility.
 *
 * Arguments:
 * 0: Player
 * 1: Object
 * 
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget] call kat_misc_fnc_buildFieldAidStation;
 *
 * Public: No
 */

params["_unit","_target"];

_target setVariable [QACEGVAR(dragging,canDrag), false, true];
_target setVariable [QACEGVAR(dragging,canCarry), false, true];

_pos = getpos _target; 
_posx = _pos select 0; 
_posy = _pos select 1; 

[{
	params["_posx", "_posy", "_target"];

    if (_target getVariable [QGVAR(FieldAidStationIsCanceled), false]) exitWith {};
    private _tarp1 = createVehicle ["Tarp_01_Small_Black_F", [_posx + 0.98, _posy, 0], [], 0, "CAN_COLLIDE"];  //Position anpassen das Medic Bag mittig ist mit neuem Modell von Pulle!
    _target setVariable [QGVAR(FieldAidStationObjects), [_tarp1], true];

}, [_posx, _posy, _target], 3] call CBA_fnc_waitAndExecute;    

[{
	params["_posx", "_posy", "_target"];

    if (_target getVariable [QGVAR(FieldAidStationIsCanceled), false]) exitWith {};
    private _tarp2 = createVehicle ["Tarp_01_Small_Black_F", [_posx - 0.98, _posy, 0], [], 0, "CAN_COLLIDE"];  //Position anpassen das Medic Bag mittig ist mit neuem Modell von Pulle!
    _variable = _target getVariable [QGVAR(FieldAidStationObjects), []];
    _variable pushBack _tarp2;
    _target setVariable [QGVAR(FieldAidStationObjects), _variable, true];

}, [_posx, _posy, _target], 7.5] call CBA_fnc_waitAndExecute;    

[{
	params["_posx", "_posy", "_target"];

    if (_target getVariable [QGVAR(FieldAidStationIsCanceled), false]) exitWith {};
    private _mat1 = createVehicle ["ShootingMat_01_Olive_F", [_posx - 0.98, _posy, 0], [], 0, "CAN_COLLIDE"];  //Position anpassen das Medic Bag mittig ist mit neuem Modell von Pulle!
    _variable = _target getVariable [QGVAR(FieldAidStationObjects), []];
    _variable pushBack _mat1;
    _target setVariable [QGVAR(FieldAidStationObjects), _variable, true];

}, [_posx, _posy, _target], 10] call CBA_fnc_waitAndExecute;    

[{
	params["_posx", "_posy", "_target"];
    
    if (_target getVariable [QGVAR(FieldAidStationIsCanceled), false]) exitWith {_target setVariable [QGVAR(FieldAidStationIsCanceled), false, true]};
    private _mat2 = createVehicle ["ShootingMat_01_Olive_F", [_posx + 0.98, _posy, 0], [], 0, "CAN_COLLIDE"];  //Position anpassen das Medic Bag mittig ist mit neuem Modell von Pulle!
    _target setVariable [QACEGVAR(medical,isMedicalFacility), true, true];
    _variable = _target getVariable [QGVAR(FieldAidStationObjects), []];
    _variable pushBack _mat2;
    _target setVariable [QGVAR(FieldAidStationObjects), _variable, true];

}, [_posx, _posy, _target], 12] call CBA_fnc_waitAndExecute;


[15, [_unit, _target], {
    params["_args"];
    _args params["_unit", "_target"];

    _target setVariable [QGVAR(FieldAidStationIsBuild), true, true];
    [_unit, "", 1] call ace_common_fnc_doAnimation;
}, {

    params["_args"];
    _args params["_unit", "_target"];

    _target setVariable [QGVAR(FieldAidStationIsCanceled), true, true];
    hint LLSTRING(FieldAidStationBuildFail);
    _variable = _target getVariable [QGVAR(FieldAidStationObjects), []];
    {
        [{
            params["_variable", "_foreachIndex", "_x"];

            deleteVehicle _x;
            _variable deleteAt _foreachIndex;

        }, [_variable, _foreachIndex, _x], 0.5] call CBA_fnc_waitAndExecute;
    } forEach _variable;
    _target setVariable [QGVAR(FieldAidStationObjects), [], true];
    [_unit, "", 1] call ace_common_fnc_doAnimation;
}, LLSTRING(FieldAidStationProgressBar)] call ace_common_fnc_progressBar;

[_unit, "AinvPknlMstpSnonWnonDnon_medic4"] call ace_common_fnc_doAnimation;