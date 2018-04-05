params ["_unit", "_status"];

_unit allowDamage (!_status);
if (isPlayer _unit) then {
	private _statusMessage = if (_status) then {
		"Entering"
	} else {
		"Exiting"
	};
	[format ["%1 safe zone!", _statusMessage]] remoteExec ["hint", _unit];
};
