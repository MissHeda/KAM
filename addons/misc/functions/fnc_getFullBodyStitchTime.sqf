#include "..\script_component.hpp"
/*
 * Author: kymckay
 * Calculates the Surgical Kit treatment time based on the amount of stitchable wounds on the Full Body.
 *
 * Arguments:
 * 0: Medic (not used) <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * Treatment Time <NUMBER>
 *
 * Example:
 * [player, cursorObject] call kat_misc_fnc_getFullBodyStitchTime
 *
 * Public: No
 */

params ["", "_patient"];


private _stitchableTotal = 0;

{
    _stitchableTotal = _stitchableTotal + count _x;
} forEach (_patient call FUNC(getFullBodyStitchableWounds));

_stitchableTotal * GVAR(woundStitchTime);