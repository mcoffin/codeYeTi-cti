params ["_player", "_corpse"];

_player addEventHandler ["InventoryOpened", { _this call CTI_fnc_onInventoryOpened }];
_player addEventHandler ["HandleRating", {0}];

if (!isNil "cti_reviveRespawn") then {
	cti_reviveRespawn call BIS_fnc_removeRespawnPosition;
};

deleteVehicle _corpse;
