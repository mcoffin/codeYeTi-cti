#include "\a3\editor_f\Data\Scripts\dikCodes.h"

if (!isNil "CBA_fnc_addKeybind") then {
	["codeYeTi CTI", "cti_jump", ["Jump", "Jump"], {_this call {
		if (player call CTI_fnc_canJump) then {
			player setVariable ["cti_lastJumpTime", time];
			[player] remoteExec ["life_fnc_jumpFnc", 0];
		};
	}}, "", [DIK_SPACE, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
} else {
	[] spawn {
		waitUntil {!isNull (findDisplay 46)};
		(findDisplay 46) displayAddEventHandler ["KeyDown", {_this call CTI_fnc_jumpKeyHandler}];
	};
};
