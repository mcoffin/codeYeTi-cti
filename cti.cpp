class factions {
	class FactionBase {
		#include "prices.cpp"
		arsenalWeapons[] = {
			"srifle_DMR_03_F",
			"srifle_DMR_03_multicam_F",
			"srifle_DMR_03_khaki_F",
			"srifle_DMR_03_tan_F",
			"srifle_DMR_03_woodland_F",
			"srifle_DMR_06_camo_F",
			"srifle_DMR_06_olive_F",
			"srifle_EBR_F"
		};
		arsenalItems[] = {
			"optic_MRCO",
			"optic_Arco",
			"optic_Arco_blk_F",
			"optic_Arco_ghex_F"
		};
	};
	class WEST: FactionBase {
		markerType = "flag_NATO";

		arsenalWeapons[] += {
			"arifle_Mk20_plain_F",
			"arifle_Mk20_F",
			"arifle_SPAR_01_blk_F",
			"arifle_SPAR_01_khk_F",
			"arifle_SPAR_01_snd_F"
		};

		arsenalItems[] += {
			"H_PilotHelmetFighter_B"
		};
	};
	class EAST: FactionBase {
		markerType = "flag_CSAT";

		arsenalWeapons[] += {
			"arifle_TRG20_F",
			"arifle_TRG21_F"
		};

		arsenalItems[] += {
			"H_PilotHelmetFighter_O"
		};
	};
};

class Player {
	startingMoney = 5000;
};

class Headquarters {
	safeZoneRadius = 500;
};

class CapturePoint {
	maxCaptureRate = 5;
	tickDuration = 30;
	maxOwnership = 100;
	radius = 100;
};

class HoldActions {
	class Revive {
		idleIcon = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa";
		progressIcon = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa";
	};
};
