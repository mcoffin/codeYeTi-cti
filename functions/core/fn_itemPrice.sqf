private _itemCfg = missionConfigFile >> "codeYeTi_cti_config" >> "Prices" >> _this;
if (!isNumber (_itemCfg >> "price")) then {
	-1
} else {
	getNumber (_itemCfg >> "price")
}
