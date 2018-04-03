params ["_logic"];
private ["_ret"];

_ret = switch (typeOf _logic) do {
	case "SideBLUFOR_F": { west };
	case "SideOPFOR_F": { east };
	case "SideIndependent_F": { resistance };
	default { sideUnknown };
};
_ret
