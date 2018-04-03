private ["_ret"];
_ret = getNumber (configFile >> "CfgVehicles" >> (typeOf _this) >> "isBackpack");
_ret > 0
