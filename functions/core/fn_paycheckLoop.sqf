private ["_tickDuration", "_paycheck"];
private _playerConfig = missionConfigFile >> "codeYeTi_cti_config" >> "Player";
_tickDuration = getNumber (_playerConfig >> "tickDuration");
_paycheck = getNumber (_playerConfig >> "paycheck");
while {isNil "cti_winner"} do {
	sleep _tickDuration;
	_paycheck call CTI_fnc_paycheck;
};
