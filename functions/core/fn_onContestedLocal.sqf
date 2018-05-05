params ["_cap", "_capName", "_owningSide", "_controllingSide"];
private _respawnId = _cap getVariable ["cti_respawnId", -1];
[_owningSide, _respawnId] call BIS_fnc_removeRespawnPosition;
systemChat format ["%1 can no longer spawn at %2.", _owningSide, _capName];
