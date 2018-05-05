params ["_flag", "_name"];
private ["_capturePointConfig"];

_capturePointConfig = missionConfigFile >> "codeYeTi_cti_config" >> "CapturePoint";

if (isServer) then {
	private _capRadius = getNumber (_capturePointConfig >> "radius");
	_flag setVariable ["cti_faction", sideUnknown];
	_flag setVariable ["cti_ownership", 100];
	_flag setVariable ["cti_name", _name];
	
	createMarker [_name, getPos _flag];
	_name setMarkerShape "ELLIPSE";
	_name setMarkerSize [_capRadius, _capRadius];
	_name setMarkerAlpha 0.5;
	
	private _nameMarker = format ["%1_name", _name];
	createMarker [_nameMarker, getPos _flag];
	_nameMarker setMarkerType "mil_objective";
	_nameMarker setMarkerText _name;
	
	[_flag, _name] call CTI_fnc_updateCapMarker;

	private _trigger = createTrigger ["EmptyDetector", getPos _flag, false];
	_trigger setTriggerArea [_capRadius, _capRadius, 0, false];
	_trigger setTriggerActivation ["ANY", "PRESENT", true];
	_trigger setTriggerStatements ["false", "", ""];
	_flag setVariable ["cti_trigger", _trigger];
};

{
	private _markerName = format ["%1%2", _name, _forEachIndex];
	[_markerName, getPos _flag, getPos _x] call codeYeTi_fnc_createLineMarker;
} forEach (synchronizedObjects _flag);

cti_caps append [_this];
