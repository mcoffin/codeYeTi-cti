private ["_cap", "_tickDuration", "_maxOwnership", "_maxCaptureRate"];

_tickDuration = getNumber (missionConfigFile >> "codeYeTi_cti_config" >> "CapturePoint" >> "tickDuration");
_maxOwnership = getNumber (missionConfigFile >> "codeYeTi_cti_config" >> "CapturePoint" >> "maxOwnership");
_maxCaptureRate = getNumber (missionConfigFile >> "codeYeTi_cti_config" >> "CapturePoint" >> "maxCaptureRate");

while { isNil "cti_winner" } do {
	sleep _tickDuration;
	_sides = [];
	{ _sides append [[_x] call CTI_fnc_logicSide]; } forEach cti_sides;
	{
		_cap = _x select 0;
		private _trigger = _cap getVariable ["cti_trigger", objNull];
		_capUnits = list _trigger;
		_controllingSideDelta = 0;
		_controllingSideCount = 0;
		_controllingSide = sideUnknown;
		{ 
			private _sideCount = _x countSide _capUnits;
			if (_sideCount == _controllingSideCount) then {
				_controllingSide = sideUnknown;
			};
			if (_sideCount > _controllingSideCount) then {
				_controllingSide = _x;
				_controllingSideDelta = _controllingSideCount - _sideCount;
				_controllingSideCount = _sideCount;
			};
		} forEach _sides;
		_controllingSideDelta = _controllingSideDelta max (0 - _maxCaptureRate);
		if (_controllingSide != sideUnknown) then {
			_owningSide = _cap getVariable ["cti_faction", sideUnknown];
			if (_owningSide != _controllingSide) then {
				private _ownership = _cap getVariable ["cti_ownership", _maxOwnership];
				_ownership = _ownership + _controllingSideDelta;
				_ownership = if (_ownership < 0) then {
					_cap setVariable ["cti_faction", _controllingSide];
					_maxOwnership
				} else {
					_ownership
				};
				_cap setVariable ["cti_ownership", _ownership];
			} else {
				private _ownership = _cap getVariable ["cti_ownership", _maxOwnership];
				_ownership = _ownership - _controllingSideDelta;
				_ownership = _ownership min _maxOwnership;
				_cap setVariable ["cti_ownership", _ownership];
			};
			[_cap, _cap getVariable ["cti_name", "dummy"]] call CTI_fnc_updateCapMarker;
		};
	} forEach cti_caps;
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
