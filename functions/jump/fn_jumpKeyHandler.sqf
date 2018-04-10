params ["_ctrl", "_code", "_shift", "_ctrlKey", "_alt"];
private ["_handled"];
_handled = false;

switch (_code) do {
	case 57: {
		if (player call CTI_fnc_canJump) then {
			player setVariable ["cti_lastJumpTime", time];
			[player] remoteExec ["life_fnc_jumpFnc", 0];
			_handled = true;
		};
	};
};

_handled;
