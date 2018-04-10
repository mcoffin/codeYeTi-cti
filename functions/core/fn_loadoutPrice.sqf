params ["_unit", "_prefix"];
private ["_purchases", "_fnc_getLoadoutVariable", "_total"];

_fnc_getLoadoutVariable = {
	_unit getVariable (format ["%1_%2", _prefix, _this]);
};

_purchases = [];
_total = 0;

if (headgear _unit != "headgear" call _fnc_getLoadoutVariable) then {
	_purchases append [headgear _unit];
};

{
	private _itemCost = _x call CTI_fnc_itemPrice;
	if (_itemCost < 0) then {
		["Unknown item: %1", _x] call BIS_fnc_error;
	} else {
		_total = _itemCost + _total;
	};
} forEach _purchases;
_total
