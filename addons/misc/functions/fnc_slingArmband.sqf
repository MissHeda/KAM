#include "script_component.hpp"

params [
	"_unit",
	"_armbanditem",
	"_limbnumber"
];

//Attach armband to left arm
if(_limbnumber == 0) then {
	_armbandLA = "Kat_armbandWC" createVehicle position _unit;


	_unit removeItem _armbanditem;
	_unit setVariable [QGVAR(isLeftArmFree), false, true];
	_unit setVariable [QGVAR(whichArmabndisSlinged), _armbandLA, true];
};


//Attach armband to right arm
if(_limbnumber == 1) then {
	_armbandRA = "Kat_armbandWC" createVehicle position _unit;
	_armbandRA attachTo [_unit,[-0.228,-0.087,-0.45],"rightforearm",true];  //ADD CBA setting for adjustments
	[ArmbandRA, [5,-5,-5]] call BIS_fnc_setObjectRotation;		//ADD CBA setting for adjustments

	_unit removeItem _armbanditem;
	_unit setVariable [QGVAR(isRightArmFree), false, true];
	_unit setVariable [QGVAR(whichArmabndisSlinged), _armbandRA, true];
};


//Attach armband to left leg
if(_limbnumber == 2) then {
	_armbandLL = "Kat_armbandWC" createVehicle position _unit;
	_armbandLL attachTo [_unit,[0.435,-0.075,-0.38],"LeftUpLeg",true];  
	[ArmbandLL, [-160,-5,45]] call BIS_fnc_setObjectRotation;

	_unit removeItem _armbanditem;
	_unit setVariable [QGVAR(isLeftLegFree), false, true];
	_unit setVariable [QGVAR(whichArmabndisSlinged), _armbandLL, true];
};


//Attach armband to right leg
if(_limbnumber == 3) then {
	_armbandRL = "Kat_armbandWC" createVehicle position _unit;
	_armbandRL attachTo [_unit,[-0.32,-0.29,-0.42],"RightUpLeg",true];  //ADD CBA setting for adjustments
	[ArmbandRL, [-30,-5,38]] call BIS_fnc_setObjectRotation;	//ADD CBA setting for adjustments

	_unit removeItem _armbanditem;
	_unit setVariable [QGVAR(isRightLegFree), false, true];
	_unit setVariable [QGVAR(whichArmabndisSlinged), _armbandRL, true];
};





