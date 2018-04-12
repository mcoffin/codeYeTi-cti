params ["_veh"];
private ["_side"];

_side = sideUnknown;

switch (typeOf _veh) do {
	case "B_Truck_01_covered_F": { _side = west; };
	case "O_Truck_03_covered_F": { _side = east; };
	case "I_Truck_02_covered_F": { _side = resistance; };
};

hint (str _side);

if (_side != sideUnknown) then {
	[_side, _veh] call BIS_fnc_addRespawnPosition;
	_veh setVariable ["cti_side", _side];
	_veh addEventHandler ["GetIn", {
		params ["_vehicle", "_role", "_unit", "_turret"];
		private ["_handled"];
		_handled = false;
		if (side _unit != _vehicle getVariable ["cti_side", sideUnknown]) then {
			_handled = true;
		};
		_handled
	}];
};
