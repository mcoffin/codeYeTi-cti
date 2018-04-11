params ["_side", "_cap"];
private ["_count"];

_count = { _x getVariable ["cti_faction", sideUnknown] == _side } count (synchronizedObjects _cap);
if (_count > 0) exitWith { true };

_count = { (_x select 0) getVariable ["cti_faction", sideUnknown] == _side } count cti_caps;
_count <= 0
