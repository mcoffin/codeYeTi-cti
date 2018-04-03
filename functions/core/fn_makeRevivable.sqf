params ["_unit"];
private ["_actionConfig"];

_actionConfig = missionConfigFile >> "codeYeTi_cti_config" >> "HoldActions" >> "Revive";

[
	_unit,
	"Revive",
	getText (_actionConfig >> "idleIcon"),
	getText (_actionConfig >> "progressIcon"),
	"([_target, player] call CTI_fnc_canRevive) && cursorTarget == _target",
	"!alive _target",
	{},
	{},
	{
		params ["_target"];
		_target remoteExecCall ["CTI_fnc_revived", _target];
	},
	{},
	[],
	5,
	0,
	true,
	false
] call BIS_fnc_holdActionAdd;
