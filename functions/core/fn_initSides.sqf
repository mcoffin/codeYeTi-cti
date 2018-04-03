params ["_stage"];
private ["_side", "_markerType", "_markerName"];

switch (_stage) do {
	case "preInit": {
		cti_sides = [];
		cti_caps = [];
	};
	case "postInit": {
		{
			private ["_logicGroup", "_respawn"];

			_side = [_x] call CTI_fnc_logicSide;
			_markerName = format ["respawn_%1_hq", _side call CTI_fnc_respawnPrefix];
			_markerType = getText (missionConfigFile >> "codeYeTi_cti_config" >> "factions" >> (str _side) >> "markerType");
			createMarkerLocal [_markerName, position _x];
			_markerName setMarkerTypeLocal _markerType;
			_markerName setMarkerTextLocal "HQ";
		} forEach cti_sides;
		[] spawn CTI_fnc_ownershipLoop;
	};
};
1
