#include "script_component.hpp"
/*
 * Author: Digii
 * Splits an string into an array. (that can be used by CBA settings)
 *
 * Arguments:
 * 0: String
 *
 * Return Value:
 * _array
 *
 * Example:
 * ["-0.228, -0.087, -0.45"] call kat_misc_fnc_getVariable;
 *
 * Public: No
 */

params ["_str"];

private _clipstring = _str splitstring ","" ";
private _array = [];

{
	private _i = parseNumber _x;
	_array pushBack _i;
} forEach _clipstring;

_array