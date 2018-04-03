private ["_ret"];

_ret = toLower (str _this);

switch (_ret) do {
	case "guer": { "guerrila" };
	case "civ": { "civilian" };
	default { _ret };
}
