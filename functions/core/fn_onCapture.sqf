params ["_cap", "_oldSide", "_newSide"];
private ["_capName", "_respawnId"];
_capName = _cap getVariable ["cti_name", "dummy"];
_cap setVariable ["cti_faction", _newSide];
[_cap, _capName, _oldSide, _newSide] remoteExecCall ["CTI_fnc_onCaptureLocal", 0];
