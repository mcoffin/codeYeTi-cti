params ["_lineMarkerName", "_pos0", "_pos1"];
private ["_markerPosX", "_markerPosY", "_vx", "_vy", "_lineLength"];

_markerPosX = [_pos0 select 0, _pos1 select 0] call BIS_fnc_arithmeticMean;
_markerPosY = [_pos0 select 1, _pos1 select 1] call BIS_fnc_arithmeticMean;

_vx = (_pos1 select 0) - (_pos0 select 0);
_vy = (_pos1 select 1) - (_pos0 select 1);

_lineLength = ([_pos0, _pos1] call BIS_fnc_distance2D) / 2.0;
_lineLength = _lineLength * 0.8;

createMarkerLocal [_lineMarkerName, [_markerPosX, _markerPosY]];
_lineMarkerName setMarkerShapeLocal "RECTANGLE";
_lineMarkerName setMarkerSizeLocal [_lineLength, 15];
_lineMarkerName setMarkerDirLocal ((_vx atan2 _vy) + 90.0);