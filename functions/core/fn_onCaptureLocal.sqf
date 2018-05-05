params ["_cap", "_capName", "_oldSide", "_newSide"];
private _nameMarker = format ["%1_name", _capName];
hint format ["%1 has captured %2!", str _newSide, _capName];
private _respawnId = [_newSide, _nameMarker, _capName] call BIS_fnc_addRespawnPosition;
_cap setVariable ["cti_respawnId", _respawnId];
