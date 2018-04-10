params ["_unit", "_prefix"];
private ["_headgear"];

_headgear = _unit getVariable [format ["%1_headgear", _prefix], nil];
if (!isNil "_headgear") then {
	_unit addHeadgear _headgear;
};
