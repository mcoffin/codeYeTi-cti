params ["_player", "_corpse"];

_player addEventHandler ["InventoryOpened", { _this call CTI_fnc_onInventoryOpened }];
_player addEventHandler ["HandleRating", {0}];

[_corpse, _player, "cti_loadout"] call CTI_fnc_copyLoadout;
[_player, "cti_loadout"] call CTI_fnc_applyLoadout;

if (!isNil "cti_reviveRespawn") then {
	cti_reviveRespawn call BIS_fnc_removeRespawnPosition;
};

deleteVehicle _corpse;
