params [
	["_unit", objNull, [objNull]],
	["_killer", objNull, [objNull]]
];

removeAllWeapons _unit;

if (_unit call CTI_fnc_canBeRevived) then {
	[_unit] remoteExecCall ["CTI_fnc_makeRevivable", 0];
};
