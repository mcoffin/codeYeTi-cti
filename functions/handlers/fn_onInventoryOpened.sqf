params ["_unit", "_container"];

if (isNil "_container") exitWith { false };

if (_container call CTI_fnc_isBackpack) exitWith { true };

if (_container isKindOf "Man" && !alive _container) exitWith { true };

false
