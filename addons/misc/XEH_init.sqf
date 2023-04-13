#include "script_component.hpp"

params ["_unit"];

if (!local _unit) exitWith {};
_unit call FUNC(init);

_unit addEventHandler ["Put", LINKFUNC(checkOnlyMedicItems)];
_unit addEventHandler ["InventoryOpened", LINKFUNC(openInventory)];