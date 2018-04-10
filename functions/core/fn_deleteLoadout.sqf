params ["_unit", "_prefix"];

{
	_unit setVariable [format ["%1_%2", _prefix, _x], nil];
} forEach ["headgear", "uniform", "vest", "backpack", "items", "weapons", "magazines"];
