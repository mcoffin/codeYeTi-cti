disableSerialization;
if (hasInterface) then {
	[] spawn {
		private ["_dmg", "_hudBase", "_hudDisplay"];
		_hudBase = 1000;

		waitUntil {! isNull findDisplay 46};

		cutRsc ["cti_HUD", "PLAIN"];

		waitUntil {! isNil "cti_hud"};
		_hudDisplay = cti_hud;

		[_hudDisplay, _hudBase, 1.0] call CTI_fnc_updateProgressBar;

		while {!isNil "cti_winner"} do {
			_dmg = damage player;
			waitUntil {!(_dmg == (damage player))};
			[_hudDisplay, _hudBase, 1.0 - (damage player)] call CTI_fnc_updateProgressBar;
		};
	};
};
