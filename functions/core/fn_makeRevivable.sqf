params ["_unit"];

if ([] call CTI_fnc_canRevive) then {
	[
		_unit,
		"Revive",
		"\a3\ui_f\data\revive\medikit_ca.paa",
		"\a3\ui_f\data\revive\medikit_ca.paa",
		"cursorTarget == _target",
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
};
