define(`CTI_TEXCOLOR', `#(argb,8,8,3)color($1,$2,$3,$4)')dnl
define(`CTI_PROGRESS_BAR', `
class CTI_ProgressBar_$1_bar: RscProgress {
	idc = $2 + 1;
	colorFrame[] = { 0, 0, 0, 1 };
	colorBar[] = { 1, 1, 1, 1 };
	texture = "CTI_TEXCOLOR(0, 1, 0, 1)";
	x = $3;
	y = $4;
	w = $5;
	h = $6;
};
class CTI_ProgressBar_$1_label: RscText {
	idc = $2 + 2;
	text = "100";
	type = 0;
	style = 0x02;
	font = "EtelkaMonospacePro";
	sizeEx = $6 - 0.005;
	x = $3;
	y = $4;
	w = $5;
	h = $6;
	colorBackground[] = { 0, 0, 0, 0 };
	colorText[] = { 1, 1, 1, 1 };
};
')dnl
