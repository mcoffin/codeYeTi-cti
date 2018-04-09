params ["_stage"];
private ["_side", "_markerType", "_markerName"];

switch (_stage) do {
	case "preInit": {
		cti_sides = [];
		cti_caps = [];
	};
	case "postInit": {
		{
			private ["_logicGroup", "_respawn", "_hqSafeZoneRadius", "_safeZoneMarker"];

			_side = [_x] call CTI_fnc_logicSide;

			_hqSafeZoneRadius = getNumber (missionConfigFile >> "codeYeTi_cti_config" >> "Headquarters" >> "safeZoneRadius");
			_safeZoneMarker = format ["safezone_%1_hq", _side call CTI_fnc_respawnPrefix];
			createMarkerLocal [_safeZoneMarker, position _x];
			_safeZoneMarker setMarkerShapeLocal "ELLIPSE";
			_safeZoneMarker setMarkerColorLocal (_side call CTI_fnc_sideColor);
			_safeZoneMarker setMarkerSizeLocal [_hqSafeZoneRadius, _hqSafeZoneRadius];
			_safeZoneMarker setMarkerBrushLocal "DiagGrid";

			if (hasInterface && (side player) == _side) then {
				private _safeZone = createTrigger ["EmptyDetector", position _x, false];
				_safeZone setVariable ["cti_side", _side];
				_safeZone setTriggerArea [_hqSafeZoneRadius, _hqSafeZoneRadius, 0, false];
				_safeZone triggerAttachVehicle [player];
				_safeZone setTriggerActivation ["VEHICLE", "PRESENT", true];
				_safeZone setTriggerStatements ["this", "{ [_x, true] call CTI_fnc_setSafeZone; } forEach thisList", "[(triggerAttachedVehicle thisTrigger), false] call CTI_fnc_setSafeZone"];
			};

			_markerName = format ["respawn_%1_hq", _side call CTI_fnc_respawnPrefix];
			_markerType = getText (missionConfigFile >> "codeYeTi_cti_config" >> "factions" >> (str _side) >> "markerType");
			createMarkerLocal [_markerName, position _x];
			_markerName setMarkerTypeLocal _markerType;
			_markerName setMarkerTextLocal "HQ";
		} forEach cti_sides;

		if (isServer) then {
			private ["_fnc_onPlayerConnected"];
			_fnc_onPlayerConnected = {
				params ["_id", "_uid", "_name", "_jip", "_owner"];
				if (isServer) then {
					private _moneyVar = format ["cti_money_%1", _uid];
					private _defaultMoney = getNumber (missionConfigFile >> "codeYeTi_cti_config" >> "Player" >> "startingMoney");
					if (isNil _moneyVar) then {
						missionNamespace setVariable [_moneyVar, _defaultMoney];
					};
					_owner publicVariableClient _moneyVar;
				};
			};
			["cti_onPlayerConnected_server", "onPlayerConnected", _fnc_onPlayerConnected, []] call BIS_fnc_addStackedEventHandler;
			if (hasInterface) then {
				[nil, getPlayerUID player, profileName, false, clientOwner] call _fnc_onPlayerConnected;
			};
			[] spawn CTI_fnc_ownershipLoop;
		};
	};
};
1
