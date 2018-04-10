params ["_unit", "_prefix"];

_unit setVariable [format ["%1_headgear", _prefix], headgear _unit];
_unit setVariable [format ["%1_uniform", _prefix], uniform _unit];
_unit setVariable [format ["%1_vest", _prefix], vest _unit];
_unit setVariable [format ["%1_backpack", _prefix], backpack _unit];
_unit setVariable [format ["%1_items", _prefix], items _unit];
_unit setVariable [format ["%1_weapons", _prefix], weaponsItems _unit];
