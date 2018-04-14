if (hasInterface) then {
	[] spawn {
		disableSerialization;
		private ["_dmg", "_hudBase", "_hudDisplay", "_fnc_onMoneyChange", "_moneyVar"];
		_hudBase = 1000;

		waitUntil {! isNull findDisplay 46};

		cti_hudLayer = ["cti_hudLayer"] call BIS_fnc_rscLayer;
		cti_hudLayer cutRsc ["cti_HUD", "PLAIN"];

		waitUntil {! isNil {uiNamespace getVariable "cti_hud"}};
		_hudDisplay = uiNamespace getVariable "cti_hud";

		[_hudDisplay, _hudBase, 1.0] call CTI_fnc_updateProgressBar;

		_moneyVar = format ["cti_money_%1", getPlayerUID player];
		_moneyVar addPublicVariableEventHandler CTI_fnc_onMoneyChanged;
		if (isServer && hasInterface) then {
			waitUntil {!isNil _moneyVar};
			[_moneyVar, missionNamespace getVariable [_moneyVar, -1]] call CTI_fnc_onMoneyChanged;
		};

		while {isNil "cti_winner"} do {
			_dmg = damage player;
			waitUntil {!(_dmg == (damage player))};
			[_hudDisplay, _hudBase, 1.0 - (damage player)] call CTI_fnc_updateProgressBar;
		};
	};
};
