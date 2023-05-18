#include "script_component.hpp"

params [
	"_unit",
	"_armbanditem",
	"_limbnumber"
];

switch (_limbnumber) do 
{
	// Attach to left arm
	case 0: { 
		switch (_armbanditem) do 
		{
			case "kat_armband_red_cross": { 
				_armbandLA = "Kat_armbandRC" createVehicle position _unit;
				_armbandLA attachTo [_unit,[-0.228,-0.087,-0.45],"leftforearm",true];
				[_armbandLA, [5,-5,-5]] call BIS_fnc_setObjectRotation;	

				_unit removeItem _armbanditem;
				_unit setVariable [QGVAR(isLeftArmFree), false, true];
				_unit setVariable [QGVAR(whichArmabndisSlinged), _armbandLA, true];
			};

			case "kat_armband_medic": {
				_armbandLA = "Kat_armbandRCM" createVehicle position _unit;
				_armbandLA attachTo [_unit,[-0.228,-0.087,-0.45],"leftforearm",true];
				[_armbandLA, [5,-5,-5]] call BIS_fnc_setObjectRotation;	

				_unit removeItem _armbanditem;
				_unit setVariable [QGVAR(isLeftArmFree), false, true];
				_unit setVariable [QGVAR(whichArmabndisSlinged), _armbandLA, true];
			};

			case "kat_armband_doctor": {
				_armbandLA = "Kat_armbandRCD" createVehicle position _unit;
				_armbandLA attachTo [_unit,[-0.228,-0.087,-0.45],"leftforearm",true];
				[_armbandLA, [5,-5,-5]] call BIS_fnc_setObjectRotation;	

				_unit removeItem _armbanditem;
				_unit setVariable [QGVAR(isLeftArmFree), false, true];
				_unit setVariable [QGVAR(whichArmabndisSlinged), _armbandLA, true];
			};

			case "kat_armband_kat": {
				_armbandLA = "Kat_armbandKAT" createVehicle position _unit;
				_armbandLA attachTo [_unit,[-0.228,-0.087,-0.45],"leftforearm",true];
				[_armbandLA, [5,-5,-5]] call BIS_fnc_setObjectRotation;	

				_unit removeItem _armbanditem;
				_unit setVariable [QGVAR(isLeftArmFree), false, true];
				_unit setVariable [QGVAR(whichArmabndisSlinged), _armbandLA, true];
			};
		};
	};
	
	// Attach to right arm
	case 1: { 
		switch (_armbanditem) do 
		{
			case "kat_armband_red_cross": { 
				_armbandRA = "Kat_armbandRC" createVehicle position _unit;
				_armbandRA attachTo [_unit,[-0.228,-0.087,-0.45],"rightforearm",true];  //ADD CBA setting for adjustments
				[_armbandRA, [5,-5,-5]] call BIS_fnc_setObjectRotation;		//ADD CBA setting for adjustments

				_unit removeItem _armbanditem;
				_unit setVariable [QGVAR(isRightArmFree), false, true];
				_unit setVariable [QGVAR(whichArmabndisSlinged), _armbandRA, true];
			};

			case "kat_armband_medic": {
				_armbandRA = "Kat_armbandRCM" createVehicle position _unit;
				_armbandRA attachTo [_unit,[-0.228,-0.087,-0.45],"rightforearm",true];  //ADD CBA setting for adjustments
				[_armbandRA, [5,-5,-5]] call BIS_fnc_setObjectRotation;		//ADD CBA setting for adjustments

				_unit removeItem _armbanditem;
				_unit setVariable [QGVAR(isRightArmFree), false, true];
				_unit setVariable [QGVAR(whichArmabndisSlinged), _armbandRA, true];
			};

			case "kat_armband_doctor": {
				_armbandRA = "Kat_armbandRCD" createVehicle position _unit;
				_armbandRA attachTo [_unit,[-0.228,-0.087,-0.45],"rightforearm",true];  //ADD CBA setting for adjustments
				[_armbandRA, [5,-5,-5]] call BIS_fnc_setObjectRotation;		//ADD CBA setting for adjustments

				_unit removeItem _armbanditem;
				_unit setVariable [QGVAR(isRightArmFree), false, true];
				_unit setVariable [QGVAR(whichArmabndisSlinged), _armbandRA, true];
			};

			case "kat_armband_kat": {
				_armbandRA = "Kat_armbandKAT" createVehicle position _unit;
				_armbandRA attachTo [_unit,[-0.228,-0.087,-0.45],"rightforearm",true];  //ADD CBA setting for adjustments
				[_armbandRA, [5,-5,-5]] call BIS_fnc_setObjectRotation;		//ADD CBA setting for adjustments

				_unit removeItem _armbanditem;
				_unit setVariable [QGVAR(isRightArmFree), false, true];
				_unit setVariable [QGVAR(whichArmabndisSlinged), _armbandRA, true];
			};
		};
	};

	// Attach to left leg
	case 2: { 
		switch (_armbanditem) do 
		{
			case "kat_armband_red_cross": { 
				_armbandLL = "Kat_armbandRC" createVehicle position _unit;
				_armbandLL attachTo [_unit,[0.435,-0.075,-0.38],"LeftUpLeg",true];  
				[_armbandLL, [-160,-5,45]] call BIS_fnc_setObjectRotation;

				_unit removeItem _armbanditem;
				_unit setVariable [QGVAR(isLeftLegFree), false, true];
				_unit setVariable [QGVAR(whichArmabndisSlinged), _armbandLL, true];
			};

			case "kat_armband_medic": {
				_armbandLL = "Kat_armbandRCM" createVehicle position _unit;
				_armbandLL attachTo [_unit,[0.435,-0.075,-0.38],"LeftUpLeg",true];  
				[_armbandLL, [-160,-5,45]] call BIS_fnc_setObjectRotation;

				_unit removeItem _armbanditem;
				_unit setVariable [QGVAR(isLeftLegFree), false, true];
				_unit setVariable [QGVAR(whichArmabndisSlinged), _armbandLL, true];
			};

			case "kat_armband_doctor": {
				_armbandLL = "Kat_armbandRCD" createVehicle position _unit;
				_armbandLL attachTo [_unit,[0.435,-0.075,-0.38],"LeftUpLeg",true];  
				[_armbandLL, [-160,-5,45]] call BIS_fnc_setObjectRotation;

				_unit removeItem _armbanditem;
				_unit setVariable [QGVAR(isLeftLegFree), false, true];
				_unit setVariable [QGVAR(whichArmabndisSlinged), _armbandLL, true];
			};

			case "kat_armband_kat": {
				_armbandLL = "Kat_armbandKAT" createVehicle position _unit;
				_armbandLL attachTo [_unit,[0.435,-0.075,-0.38],"LeftUpLeg",true];  
				[_armbandLL, [-160,-5,45]] call BIS_fnc_setObjectRotation;

				_unit removeItem _armbanditem;
				_unit setVariable [QGVAR(isLeftLegFree), false, true];
				_unit setVariable [QGVAR(whichArmabndisSlinged), _armbandLL, true];
			};
		};
	};

	// Attach to right leg
	case 3: { 
		switch (_armbanditem) do 
		{
			case "kat_armband_red_cross": { 
				_armbandRL = "Kat_armbandRC" createVehicle position _unit;
				_armbandRL attachTo [_unit,[-0.32,-0.29,-0.42],"RightUpLeg",true];  //ADD CBA setting for adjustments
				[_armbandRL, [-30,-5,38]] call BIS_fnc_setObjectRotation;	//ADD CBA setting for adjustments

				_unit removeItem _armbanditem;
				_unit setVariable [QGVAR(isRightLegFree), false, true];
				_unit setVariable [QGVAR(whichArmabndisSlinged), _armbandRL, true];
			};

			case "kat_armband_medic": {
				_armbandRL = "Kat_armbandRCM" createVehicle position _unit;
				_armbandRL attachTo [_unit,[-0.32,-0.29,-0.42],"RightUpLeg",true];  //ADD CBA setting for adjustments
				[_armbandRL, [-30,-5,38]] call BIS_fnc_setObjectRotation;	//ADD CBA setting for adjustments

				_unit removeItem _armbanditem;
				_unit setVariable [QGVAR(isRightLegFree), false, true];
				_unit setVariable [QGVAR(whichArmabndisSlinged), _armbandRL, true];
			};

			case "kat_armband_doctor": {
				_armbandRL = "Kat_armbandRCD" createVehicle position _unit;
				_armbandRL attachTo [_unit,[-0.32,-0.29,-0.42],"RightUpLeg",true];  //ADD CBA setting for adjustments
				[_armbandRL, [-30,-5,38]] call BIS_fnc_setObjectRotation;	//ADD CBA setting for adjustments

				_unit removeItem _armbanditem;
				_unit setVariable [QGVAR(isRightLegFree), false, true];
				_unit setVariable [QGVAR(whichArmabndisSlinged), _armbandRL, true];
			};

			case "kat_armband_kat": {
				_armbandRL = "Kat_armbandKAT" createVehicle position _unit;
				_armbandRL attachTo [_unit,[-0.32,-0.29,-0.42],"RightUpLeg",true];  //ADD CBA setting for adjustments
				[_armbandRL, [-30,-5,38]] call BIS_fnc_setObjectRotation;	//ADD CBA setting for adjustments

				_unit removeItem _armbanditem;
				_unit setVariable [QGVAR(isRightLegFree), false, true];
				_unit setVariable [QGVAR(whichArmabndisSlinged), _armbandRL, true];
			};
		};
	};
};
