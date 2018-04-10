params ["_unit", "_prefix"];
private ["_headgear", "_uniform", "_vest", "_backpack", "_items", "_magazines"];

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

_uniform = _unit getVariable [format ["%1_uniform", _prefix], nil];
if (!isNil "_uniform") then {
	_unit forceAddUniform _uniform;
};

_vest = _unit getVariable [format ["%1_vest", _prefix], nil];
if (!isNil "_vest") then {
	_unit addVest _vest;
};

_backpack = _unit getVariable [format ["%1_backpack", _prefix], nil];
if (!isNil "_backpack") then {
	_unit addBackpack _backpack;
};

_headgear = _unit getVariable [format ["%1_headgear", _prefix], nil];
if (!isNil "_headgear") then {
	_unit addHeadgear _headgear;
};

_weapons = _unit getVariable [format ["%1_weapons", _prefix], nil];
if (!isNil "_weapons") then {
	{
		private ["_weaponIndex", "_weaponName", "_itemName"];
		_weaponIndex = _forEachIndex;
		_weaponName = (_x select 0);
		if (_weaponName != "") then {
			_unit addMagazine (_x select 4);
			_unit addWeapon _weaponName;
			for "_idx" from 1 to 5 do {
				_itemName = _x select _idx;
				if (_idx == 4) then {
					_itemName = "";
				};
				if (_itemName != "") then {
					switch (_weaponIndex) do {
						case 0: {
							_unit addPrimaryWeaponItem _itemName;
						};
						case 1: {
							_unit addSecondaryWeaponItem _itemName;
						};
						default {
							_unit addHandgunItem _itemName;
						};
					};
				};
			};
		};
	} forEach _weapons;
};

_items = _unit getVariable [format ["%1_items", _prefix], []];
_magazines = _unit getVariable [format ["%1_magazines", _prefix], []];
if (!isNil "_magazines") then {
	_items append _magazines;
};
if (!isNil "_items") then {
	{ _unit addItem _x } forEach _items;
};
