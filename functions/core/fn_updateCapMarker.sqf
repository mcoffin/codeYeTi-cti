params ["_flag", "_name"];
private ["_factionColor", "_ownership", "_nameMarker", "_capturePointConfig"];

_capturePointConfig = missionConfigFile >> "codeYeTi_cti_config" >> "CapturePoint";
_nameMarker = format ["%1_name", _name];

_factionColor = (_flag getVariable ["cti_faction", sideUnknown]) call CTI_fnc_sideColor;
_ownership = _flag getVariable ["cti_ownership", 100];
private _maxOwnership = getNumber (_capturePointConfig >> "maxOwnership");
_nameMarker setMarkerText format ["%1/%2 %3", _ownership, _maxOwnership, _name];
{
	_x setMarkerColor _factionColor;
} forEach [_name, _nameMarker];
