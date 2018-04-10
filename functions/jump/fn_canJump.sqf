if (animationState _this isEqualTo "AovrPercMrunSrasWrflDf") exitWith { false };
if (!isTouchingGround _this) exitWith { false };
if (!(stance _this isEqualTo "STAND")) exitWith { false };
if (speed _this <= 2) exitWith { false };
if (((velocity player) select 2) >= 2.5) exitWith { false };
private _lastJumpTime = _this getVariable ["cti_lastJumpTime", 0];
(time - _lastJumpTime) > 1.5
