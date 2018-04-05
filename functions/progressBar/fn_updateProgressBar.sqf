params ["_dialog", "_base", "_value"];

private _bar = _dialog displayCtrl (_base + 1);
private _label = _dialog displayCtrl (_base + 2);

_bar progressSetPosition _value;
_label ctrlSetText (str (_value * 100));
