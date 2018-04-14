params [
	["_unit", objNull, [objNull]],
	["_killer", objNull, [objNull]]
];

[_unit, "cti_loadout"] call CTI_fnc_saveLoadout;

removeAllWeapons _unit;

if (_unit call CTI_fnc_canBeRevived) then {
	systemChat "Doing revive call";
	_unit remoteExecCall ["CTI_fnc_makeRevivable", 0];
};
