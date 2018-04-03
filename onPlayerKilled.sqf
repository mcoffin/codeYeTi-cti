params [
	["_unit", objNull, [objNull]],
	["_killer", objNull, [objNull]]
];

removeAllWeapons _unit;
[_unit] spawn {
	params ["_unit"];
	sleep 3;
	_unit call CTI_fnc_revived;
};
