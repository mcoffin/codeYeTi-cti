class factions {
	class FactionBase {
		#include "prices.cpp"
	};
	class WEST: FactionBase {
		markerType = "flag_NATO";

		arsenalItems[] = {
			"H_PilotHelmetFighter_B"
		};
	};
	class EAST: FactionBase {
		markerType = "flag_CSAT";

		arsenalItems[] = {
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
