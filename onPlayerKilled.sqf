params [
	["_unit", objNull, [objNull]],
	["_killer", objNull, [objNull]]
];

removeAllWeapons _unit;
[_unit] remoteExecCall ["CTI_fnc_makeRevivable", 0];
