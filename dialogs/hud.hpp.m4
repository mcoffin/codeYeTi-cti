class cti_HUD {
	idd = 1000;
	duration = 10e10;
	movingEnable = 0;
	fadein = 0;
	fadeout = 0;
	name = "cti_HUD";
	onLoad = "cti_hud = (_this select 0);";
	objects[] = {};
	class controls {
		define(HEALTH_BAR_WIDTH, `(safezoneW * 0.1)')dnl
		define(HEALTH_BAR_HEIGHT, 0.04)dnl
		CTI_PROGRESS_BAR(Health, 1000, (safezoneX + safezoneW - HEALTH_BAR_WIDTH), (safezoneY + safezoneH - HEALTH_BAR_HEIGHT), HEALTH_BAR_WIDTH, HEALTH_BAR_HEIGHT)dnl
	};
};
