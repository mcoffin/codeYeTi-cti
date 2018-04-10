private ["_moneyVar", "_currentMoney"];
_moneyVar = format ["cti_money_%1", getPlayerUID player];
_currentMoney = missionNamespace getVariable _moneyVar;
_currentMoney = _this + _currentMoney;
missionNamespace setVariable [_moneyVar, _currentMoney + _this];
publicVariableServer _moneyVar;
systemChat format ["You have received a paycheck of $%1.", _this];
if (!isServer) then {
	private _label = (uiNamespace getVariable "cti_hud") displayCtrl 1010;
	_label ctrlSetText (format ["$%1", _currentMoney]);
};
