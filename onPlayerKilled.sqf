params [
	["_unit", objNull, [objNull]],
	["_killer", objNull, [objNull]]
];

[_unit, "cti_loadout"] call CTI_fnc_saveLoadout;

removeAllWeapons _unit;

if (_unit call CTI_fnc_canBeRevived) then {
	_unit remoteExecCall ["CTI_fnc_makeRevivable", 0];
};

if (_killer == player && [side _killer, side _unit] call BIS_fnc_sideIsEnemy) then {
	private _moneyVar = format ["cti_money_%1", getPlayerUID player];
	private _money = missionNamespace getVariable [_moneyVar, -1];
	_money = _money + 250;
	missionNamespace setVariable [_moneyVar, _money];
	publicVariableServer _moneyVar;
	systemChat format ["You received $%1 for killing another player", 250];
	[_moneyVar, _money] call CTI_fnc_onMoneyChanged;
};
