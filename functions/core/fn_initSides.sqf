params ["_stage"];
private ["_side", "_markerType", "_markerName"];

switch (_stage) do {
	case "preInit": {
		cti_sides = [];
		cti_caps = [];
	};
	case "postInit": {
		{
			private ["_logicGroup", "_respawn", "_hqSafeZoneRadius", "_safeZoneMarker", "_hqFlag", "_arsenalMagazines"];

			_side = [_x] call CTI_fnc_logicSide;

			_hqFlag = (synchronizedObjects _x) select 0;
			["AmmoboxInit", [_hqFlag, false, { side player == _side }]] call BIS_fnc_arsenal;
			private _sideConfig = missionConfigFile >> "codeYeTi_cti_config" >> "factions" >> str _side;
			private _arsenalItems = getArray (_sideConfig >> "arsenalItems");
			[_hqFlag, _arsenalItems] call BIS_fnc_addVirtualItemCargo;
			private _arsenalWeapons = getArray (_sideConfig >> "arsenalWeapons");
			_arsenalMagazines = [];
			{
				private _mags = getArray (configFile >> "CfgWeapons" >> _x >> "magazines");
				_arsenalMagazines append _mags;
			} forEach _arsenalWeapons;
			[_hqFlag, _arsenalWeapons] call BIS_fnc_addVirtualWeaponCargo;
			[_hqFlag, _arsenalMagazines] call BIS_fnc_addVirtualMagazineCargo;
			private _blacklistMagazines = getArray (_sideConfig >> "arsenalMagazineBlacklist");
			[_hqFlag, _blacklistMagazines] call BIS_fnc_removeVirtualMagazineCargo;

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

		if (hasInterface) then {
			[] spawn CTI_fnc_paycheckLoop;
			[] spawn {
				while {isNil "cti_winner"} do {
					private ["_moneyVar", "_money", "_price"];
					waitUntil { !isNull (uiNamespace getVariable "RSCDisplayArsenal" ) };
					systemChat format ["%1 opened arsenal", profileName];
					[player, "cti_loadout"] call CTI_fnc_saveLoadout;
					waitUntil { isNull (uiNamespace getVariable "RSCDisplayArsenal") };
					systemChat format ["%1 closed arsenal", profileName];
					_moneyVar = format ["cti_money_%1", getPlayerUID player];
					_money = missionNamespace getVariable [_moneyVar, -1];
					_price = [player, "cti_loadout"] call CTI_fnc_loadoutPrice;
					if (_price > _money) then {
						[player, "cti_loadout"] call CTI_fnc_applyLoadout;
						hint format ["You can't afford a loadout that costs $%1", _price];
					} else {
						_money = _money - _price;
						missionNamespace setVariable [_moneyVar, _money];
						publicVariableServer _moneyVar;
						systemChat format ["%1 bought $%2 worth of gear.", profileName, _price];
					};
				};
			};
		};
	};
};
1
