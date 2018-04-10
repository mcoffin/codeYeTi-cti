disableSerialization;
if (hasInterface) then {
	[] spawn {
		private ["_dmg", "_hudBase", "_hudDisplay", "_fnc_onMoneyChange", "_moneyVar"];
		_hudBase = 1000;

		waitUntil {! isNull findDisplay 46};

		cti_hudLayer = ["cti_hudLayer"] call BIS_fnc_rscLayer;
		cti_hudLayer cutRsc ["cti_HUD", "PLAIN"];

		waitUntil {! isNil "cti_hud"};
		_hudDisplay = cti_hud;

		[_hudDisplay, _hudBase, 1.0] call CTI_fnc_updateProgressBar;

		_moneyVar = format ["cti_money_%1", getPlayerUID player];
		_fnc_onMoneyChange = {
			private _money = _this select 1;
			private _label = cti_hud displayCtrl 1010;
			_label ctrlSetText (format ["$%1", _money]);
		};
		_moneyVar addPublicVariableEventHandler _fnc_onMoneyChange;
		if (isServer && hasInterface) then {
			waitUntil {!isNil _moneyVar};
			[_moneyVar, missionNamespace getVariable [_moneyVar, -1]] call _fnc_onMoneyChange;
		};

		while {isNil "cti_winner"} do {
			_dmg = damage player;
			waitUntil {!(_dmg == (damage player))};
			[_hudDisplay, _hudBase, 1.0 - (damage player)] call CTI_fnc_updateProgressBar;
		};
	};
};
