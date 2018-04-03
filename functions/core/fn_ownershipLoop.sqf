private _tickDuration = getNumber (missionConfigFile >> "codeYeTi_cti_config" >> "CapturePoint" >> "tickDuration");

while { isNil "cti_winner" } do {
	sleep _tickDuration;
	{
		private _side = [_x] call CTI_fnc_logicSide;
		_ownedCount = 0;
		{
			private _cap = _x select 0;
			if ((_cap getVariable ["cti_faction", sideUnknown]) == _side) then {
				_ownedCount = _ownedCount + 1;
			};
		} forEach cti_caps;
		if (_ownedCount >= (count cti_caps)) then {
			cti_winner = _forEachIndex;
		};
	} forEach cti_sides;
};

"EveryoneWon" call BIS_fnc_endMissionServer;