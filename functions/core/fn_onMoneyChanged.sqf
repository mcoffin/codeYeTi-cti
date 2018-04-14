private _money = _this select 1;
private _label = (uiNamespace getVariable "cti_hud") displayCtrl 1010;
_label ctrlSetText (format ["$%1", _money]);