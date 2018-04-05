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
						
class CTI_ProgressBar_Health_bar: RscProgress {
	idc = 1000 + 1;
	colorFrame[] = { 0, 0, 0, 1 };
	colorBar[] = { 1, 1, 1, 1 };
	texture = "#(argb,8,8,3)color(0,1,0,1)";
	x = (safezoneX + safezoneW - (safezoneW * 0.1));
	y = (safezoneY + safezoneH - 0.04);
	w = (safezoneW * 0.1);
	h = 0.04;
};
class CTI_ProgressBar_Health_label: RscText {
	idc = 1000 + 2;
	text = "100";
	type = 0;
	style = 0x02;
	font = "EtelkaMonospacePro";
	sizeEx = 0.04 - 0.005;
	x = (safezoneX + safezoneW - (safezoneW * 0.1));
	y = (safezoneY + safezoneH - 0.04);
	w = (safezoneW * 0.1);
	h = 0.04;
	colorBackground[] = { 0, 0, 0, 0 };
	colorText[] = { 1, 1, 1, 1 };
};
	};
};
