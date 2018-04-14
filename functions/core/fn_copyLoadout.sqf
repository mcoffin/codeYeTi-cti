params ["_old", "_new", "_prefix"];
{
	private _varName = format ["%1_%2", _prefix, _x];
	private _tmp = _old getVariable _varName;
	_new setVariable [_varName, _tmp];
} forEach ["headgear", "uniform", "vest", "backpack", "items", "weapons", "magazines", "assignedItems"];