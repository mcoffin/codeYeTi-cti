params ["_player"];

_player addEventHandler ["InventoryOpened", { _this call CTI_fnc_onInventoryOpened }];
_player addEventHandler ["HandleRating", {0}];
