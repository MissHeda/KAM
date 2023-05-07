#include "script_component.hpp"

params [
	"_unit",
	"_limbnumber"
];

switch (_limbnumber) do 
{
	case 0: { 
		private	_objectLA = _unit getVariable [QGVAR(whichArmabndisSlinged), ObjNull];

		switch (typeOf _objectLA) do
		{
			case "Kat_armbandWC": {
				if (_unit canAdd "Kat_armband_facewear") then {
					_unit addItem "Kat_armband_facewear";
					_unit setVariable [QGVAR(isLeftArmFree), true, true];
					deleteVehicle _objectLA;
				} else {
					hint "Not enoght space!";  //do string later!
				};
			};

			case "Kat_armbandWCM": {
				if (_unit canAdd "Kat_armband_facewear") then { //change item
					_unit addItem "Kat_armband_facewear";
					_unit setVariable [QGVAR(isRightArmFree), true, true];
					deleteVehicle _objectLA;
				} else {
					hint "Not enoght space!";  //do string later!
				};
			};

			case "Kat_armbandWCD": {
				if (_unit canAdd "Kat_armband_facewear") then { //change item
					_unit addItem "Kat_armband_facewear";
					_unit setVariable [QGVAR(isLeftLegFree), true, true];
					deleteVehicle _objectLA;
				} else {
					hint "Not enoght space!";  //do string later!
				};
			};
		};
	};

	case 1: {
		private	_objectRA = _unit getVariable [QGVAR(whichArmabndisSlinged), ObjNull];

		switch (_objectRA) do
		{
			case "Kat_armbandWC": {
				if (_unit canAdd "Kat_armband_facewear") then {
					_unit addItem "Kat_armband_facewear";
					_unit setVariable [QGVAR(isRightLegFree), true, true];
					deleteVehicle _objectRA;
				} else {
					hint "Not enoght space!";  //do string later!
				};
			};

			case "Kat_armbandWCM": {
				if (_unit canAdd "Kat_armband_facewear") then { //change item
					_unit addItem "Kat_armband_facewear";
					deleteVehicle _objectRA;
				} else {
					hint "Not enoght space!";  //do string later!
				};
			};

			case "Kat_armbandWCD": {
				if (_unit canAdd "Kat_armband_facewear") then { //change item
					_unit addItem "Kat_armband_facewear";
					deleteVehicle _objectRA;
				} else {
					hint "Not enoght space!";  //do string later!
				};
			};
		};
	};

	case 2: {
		private	_objectLL = _unit getVariable [QGVAR(whichArmabndisSlinged), ObjNull];

		switch (_objectLL) do
		{
			case "Kat_armbandWC": {
				if (_unit canAdd "Kat_armband_facewear") then {
					_unit addItem "Kat_armband_facewear";
					deleteVehicle _objectLL;
				} else {
					hint "Not enoght space!";  //do string later!
				};
			};

			case "Kat_armbandWCM": {
				if (_unit canAdd "Kat_armband_facewear") then { //change item
					_unit addItem "Kat_armband_facewear";
					deleteVehicle _objectLL;
				} else {
					hint "Not enoght space!";  //do string later!
				};
			};

			case "Kat_armbandWCD": {
				if (_unit canAdd "Kat_armband_facewear") then { //change item
					_unit addItem "Kat_armband_facewear";
					deleteVehicle _objectLL;
				} else {
					hint "Not enoght space!";  //do string later!
				};
			};
		};
	};

	case 3: {
		private	_objectRL = _unit getVariable [QGVAR(whichArmabndisSlinged), ObjNull];

		switch (_objectRL) do
		{
			case "Kat_armbandWC": {
				if (_unit canAdd "Kat_armband_facewear") then {
					_unit addItem "Kat_armband_facewear";
					deleteVehicle _objectRL;
				} else {
					hint "Not enoght space!";  //do string later!
				};
			};

			case "Kat_armbandWCM": {
				if (_unit canAdd "Kat_armband_facewear") then { //change item
					_unit addItem "Kat_armband_facewear";
					deleteVehicle _objectRL;
				} else {
					hint "Not enoght space!";  //do string later!
				};
			};

			case "Kat_armbandWCD": {
				if (_unit canAdd "Kat_armband_facewear") then { //change item
					_unit addItem "Kat_armband_facewear";
					deleteVehicle _objectRL;
				} else {
					hint "Not enoght space!";  //do string later!
				};
			};
		};
	};
};