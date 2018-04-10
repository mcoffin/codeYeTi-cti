params ["_unit", "_prefix"];
private ["_purchases", "_fnc_getLoadoutVariable", "_total", "_items", "_checkedItems", "_newItems", "_weapons"];

_fnc_getLoadoutVariable = {
	_unit getVariable (format ["%1_%2", _prefix, _this]);
};

_purchases = [];
_total = 0;

if (headgear _unit != "headgear" call _fnc_getLoadoutVariable) then {
	_purchases append [[headgear _unit, 1]];
};

if (uniform _unit != "uniform" call _fnc_getLoadoutVariable) then {
	_purchases append [[uniform _unit, 1]];
};

if (vest _unit != "vest" call _fnc_getLoadoutVariable) then {
	_purchases append [[vest _unit, 1]];
};

if (backpack _unit != "backpack" call _fnc_getLoadoutVariable) then {
	_purchases append [[backpack _unit, 1]];
};

_weapons = "weapons" call _fnc_getLoadoutVariable;
{
	private ["_oldWeapon", "_newWeapon"];
	_newWeapon = _x;
	_oldWeapon = _weapons select _forEachIndex;
	if (isNil "_oldWeapon") then {
		_oldWeapon = ["", "", "", "", [], ""];
	};
	for "_idx" from 0 to 5 do {
		if (_idx != 4) then {
			if (_newWeapon select _idx != _oldWeapon select _idx) then {
				_purchases append [[_newWeapon select _idx, 1]];
			};
		} else {
			if ((_newWeapon select _idx) select 0 != (_oldWeapon select _idx) select 0) then {
				_purchases append [[(_newWeapon select _idx) select 0, 1]];
			};
		};
	};
} forEach (weaponsItems _unit);

_items = "items" call _fnc_getLoadoutVariable;
_items append ("magazines" call _fnc_getLoadoutVariable);
_checkedItems = [];
_newItems = items _unit;
_newItems append (magazines _unit);
{
	if (_checkedItems find _x < 0) then {
		private ["_newCount", "_oldCount", "_itemName"];
		_checkedItems append [_x];
		_itemName = _x;
		_oldCount = { _x == _itemName } count _items;
		_newCount = { _x == _itemName } count (items _unit);
		if (_newCount > _oldCount) then {
			_purchases append [[_itemName, _newCount - _oldCount]];
		};
	};
} forEach (_newItems);

{
	private _item = _x select 0;
	private _quantity = _x select 1;
	private _itemCost = _item call CTI_fnc_itemPrice;
	if (_itemCost < 0) then {
		["Unknown item: %1", _item] call BIS_fnc_error;
	} else {
		_total = (_itemCost * _quantity) + _total;
	};
} forEach _purchases;
_total
