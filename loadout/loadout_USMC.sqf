/*-----------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------
***	Author: Hardballer

***	Description : 
	Loadouts de la mission

*** Utilisation :
	1/ Copiez les fichiers 'loadout.sqf', 'initPlayerLocal.sqf' et 'inventory_briefing.sqf' dans le dossier de votre mission.
	2/ Modifiez le fichier loadout.sqf à votre convenance.
		- Vous pouvez creer vos loadouts dans l'arsenal virtuel de Arma 3, les exporter avec la commande ingame et les coller dans le script comme ci-dessous.
		- Une fois ceci fait, remplacez tout les 'this' par '_unit'.
	3/ Dans l'éditeur, placez la commande ci-dessous dans les init d'unités jouables pour leur attribuer le loadout souhaité :
		this setVariable ["loadout", "cc_sl"];
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------*/


hard_setLoadout = 
{
	_unit = _this select 0;
	_loadout = _unit getVariable ["loadout","cc_r"];
	_uniform = "";
	_backpack_big = "";
	_backpack_med = "";
	_backpack_small = "";
	_helmet = "";
	_helmet_tl = "";
	_helmet_crew = "";
	_vest_r = "";
	_vest_doc = "";
	_vest_ar = "";
	_vest_mg = "";
	_vest_m = "";
	_vest_gl = "";
	_vest_sl = "";
	_vest_tl = "";
	_vest_c = "";
	_helmet = "";
	_hat = "";
	_nvg = "";
	_lamp = "";
	_weap_lat = [];
	_weap_at = [];
	_mun_at = [];
	_facewear =  "";

	switch (dax_p_nvg) do {
		case 0: {_nvg = ""; _lamp = "";};
		case 1: {_nvg = "rhsusf_ANPVS_14"; _lamp = "rhsusf_acc_anpeq16a";};
		case 2: {_nvg = ""; _lamp = "rhsusf_acc_wmx_bk";};
		default {_nvg = ""; _lamp = "";};
	};
	
	switch (dax_loadoutcamo) do {
		case "desert": {
			_uniform = "rhs_uniform_FROG01_d";
			_backpack_big = "B_Carryall_cbr";
			_backpack_med = "rhsusf_assault_eagleaiii_coy";
			_backpack_small = "rhsusf_falconii_coy";
			_helmet = if (dax_p_nvg == 1) then {"rhsusf_lwh_helmet_marpatd"} else {selectrandom ["rhsusf_lwh_helmet_marpatd","rhsusf_lwh_helmet_marpatd_ess"]};
			_helmet_tl = if (dax_p_nvg == 1) then {"rhsusf_lwh_helmet_marpatd"} else {"rhsusf_lwh_helmet_marpatd_headset"};
			_hat = "rhs_booniehat2_marpatd";
			_helmet_crew = "rhsusf_cvc_alt_helmet";
		};
		case "jungle";
		case "woodland";
		case "winter";
		case "polyvalent";
		default {
			_uniform = "rhs_uniform_FROG01_wd";
			_backpack_big = "B_Carryall_khk";
			_backpack_med = "rhsusf_assault_eagleaiii_coy";
			_backpack_small = "rhsusf_falconii_coy";
			_helmet = if (dax_p_nvg == 1) then {"rhsusf_lwh_helmet_marpatwd"} else {selectrandom ["rhsusf_lwh_helmet_marpatwd_blk_ess","rhsusf_lwh_helmet_marpatwd"]};
			_helmet_tl = if (dax_p_nvg == 1) then {"rhsusf_lwh_helmet_marpatwd"} else {"rhsusf_lwh_helmet_marpatwd_headset_blk"};
			_hat = "rhs_booniehat2_marpatwd";
			_helmet_crew = "rhsusf_cvc_green_alt_helmet";
		};
	};
	switch (cc_rhsennemy) do {
		case false: {
			_weap_lat = ["CUP_launch_M136","","","",[],[],""];
			_weap_at = ["CUP_launch_Mk153Mod0","","","cup_optic_smaw_scope",["CUP_SMAW_HEAA_M",1],[],""];
			_mun_at = [["CUP_SMAW_HEAA_M",2,1],["CUP_SMAW_Spotting",2,5]];
		};
		case true;
		default {
			_weap_lat = ["rhs_weap_M136","","","",[],[],""];
			_weap_at = ["rhs_weap_smaw","","","rhs_weap_optic_smaw",["rhs_mag_smaw_HEAA",1],[],""];
			_mun_at = [["rhs_mag_smaw_HEAA",2,1],["rhs_mag_smaw_SR",2,5]];
		};
	};

	if (dax_p_nvg < 1) then {
		_facewear = selectrandom ["CUP_TK_NeckScarf","CUP_FR_NeckScarf","CUP_FR_NeckScarf2","rhsusf_oakley_goggles_ylw","rhsusf_oakley_goggles_clr","rhsusf_oakley_goggles_blk","rhs_ess_black","rhs_googles_orange","rhs_googles_yellow","rhs_googles_clear","rhs_googles_black","G_Shades_Red","G_Shades_Green","G_Shades_Blue","G_Shades_Black"];
	} else {
		_facewear = selectRandomWeighted ["CUP_TK_NeckScarf",0.5,"CUP_FR_NeckScarf",0.5,"CUP_FR_NeckScarf2",0.5,"",0.9];
	};

	_weap_m4_cco = ["rhs_weap_m4a1_carryhandle","",_lamp,"rhsusf_acc_compm4",["rhs_mag_30Rnd_556x45_M855A1_Stanag",30],[],""];
	_weap_cco = ["rhs_weap_m16a4_carryhandle","",_lamp,"rhsusf_acc_compm4",["rhs_mag_30Rnd_556x45_M855A1_Stanag",30],[],""];
	_weap_m4_rco = ["rhs_weap_m4a1_carryhandle","",_lamp,"rhsusf_acc_acog_usmc",["rhs_mag_30Rnd_556x45_M855A1_Stanag",30],[],""];
	_weap_rco = ["rhs_weap_m16a4_carryhandle","",_lamp,"rhsusf_acc_acog_usmc",["rhs_mag_30Rnd_556x45_M855A1_Stanag",30],[],""];
	_pistol = ["rhsusf_weap_m9","","","",["rhsusf_mag_15Rnd_9x19_JHP",15],[],""];

	_vest_r = "rhsusf_spc_rifleman";
	_vest_doc = "rhsusf_spc_corpsman";
	_vest_ar = "rhsusf_spc_iar";
	_vest_mg = "rhsusf_spc_mg";
	_vest_m = "rhsusf_spc_marksman";
	_vest_gl = "rhsusf_spc_teamleader";
	_vest_sl = "rhsusf_spc_squadleader";
	_vest_tl = "rhsusf_spc_squadleader";
	_vest_c = "rhsusf_spc_crewman";

	_itemsU_base = [["ACE_fieldDressing",4],["ACE_tourniquet",1],["ACE_EarPlugs",1],["ACE_Flashlight_MX991",1],["ACRE_PRC343",1],["ACE_CableTie",1],["ACE_IR_Strobe_Item",1],["rhs_mag_an_m8hc",1,1]];
	_itemsU_tl = _itemsU_base + [["ACRE_PRC148",1],["ACE_microDAGR",1],["ACE_MapTools",1]];
	_itemsV_base = [["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",2,1],["rhs_mag_30Rnd_556x45_M855A1_Stanag",7,30],["rhsusf_mag_15Rnd_9x19_JHP",2,15]];
	_itemsB_medic = [["ACE_personalAidKit",1],["ACE_surgicalKit",1],["ACE_salineIV",2],["ACE_salineIV_250",2],["ACE_salineIV_500",2],["ACE_packingBandage",15],["ACE_fieldDressing",15],["ACE_elasticBandage",10],["ACE_quikclot",10],["ACE_morphine",8],["ACE_epinephrine",4],["ACE_tourniquet",4]];
	
	switch _loadout do 
	{
		case "cc_off": {[_unit] call loadoutCC_OFF}; // 1
		case "cc_tl": {[_unit] call loadoutCC_TL}; // 2
		case "cc_doc": {[_unit] call loadoutCC_DOC}; //3
		case "cc_ar": {[_unit] call loadoutCC_AR}; //4
		case "cc_aar": {[_unit] call loadoutCC_AAR}; //5
		case "cc_mg": {[_unit] call loadoutCC_MG}; //6
		case "cc_amg": {[_unit] call loadoutCC_AMG}; //7
		case "cc_at": {[_unit] call loadoutCC_AT}; //8
		case "cc_aat": {[_unit] call loadoutCC_AAT}; //9
		case "cc_demo": {[_unit] call loadoutCC_DEMO}; //10
		case "cc_m": {[_unit] call loadoutCC_M}; //11
		case "cc_gl": {[_unit] call loadoutCC_GL}; //12
		case "cc_a": {[_unit] call loadoutCC_A}; //13
		case "cc_lat": {[_unit] call loadoutCC_LAT}; //14
		case "cc_r": {[_unit] call loadoutCC_R}; //15
		case "cc_crew": {[_unit] call loadoutCC_CREW}; //16
		case "cc_pilot": {[_unit] call loadoutCC_PILOT}; //17
		case "cc_sniper": {[_unit] call loadoutCC_SNIPER}; //18
		case "cc_obs": {[_unit] call loadoutCC_OBS}; //19
		case "cc_jtac": {[_unit] call loadoutCC_JTAC}; //20
		default {[_unit] call loadoutCC_R};
	};
};



loadoutCC_OFF = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_m4_rco,
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest_sl,[["rhs_mag_m67",1,1],["rhs_mag_m18_green",4,1],["rhs_mag_30Rnd_556x45_M855A1_Stanag",3,30],["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",4,30],["rhsusf_mag_15Rnd_9x19_JHP",2,15]]],
		[_backpack_small,[["ACRE_PRC117F",1],["SmokeShellPurple",2,1]]],
		_helmet_tl,
		_facewear,
		["ACE_Vector","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};


loadoutCC_TL = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_rco,
		_weap_lat,
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest_tl,[["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",1,1],["rhs_mag_m18_green",3,1],["rhs_mag_30Rnd_556x45_M855A1_Stanag",3,30],["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",4,30],["rhsusf_mag_15Rnd_9x19_JHP",2,15]]],
		[],
		_helmet,
		_facewear,
		["ACE_Vector","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};

loadoutCC_DOC = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_cco,
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_doc,_itemsV_base],
		[_backpack_med,_itemsB_medic],
		_helmet,
		_facewear,
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};

loadoutCC_AR = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_m27iar_grip","",_lamp,"rhsusf_acc_acog_rmr",["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",30],[],"rhsusf_acc_harris_bipod"],
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_ar,[["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",2,1],["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",12,30],["rhsusf_mag_15Rnd_9x19_JHP",2,15]]],
		[],
		_helmet,
		_facewear,
		[],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};

loadoutCC_AAR = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_cco,
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_r,_itemsV_base],
		[_backpack_med,[["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",12,30]]],
		_helmet,
		_facewear,
		["ACE_Vector","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};
loadoutCC_MG = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_m240B","",_lamp,"rhsusf_acc_elcan",["rhsusf_50Rnd_762x51_m62_tracer",50],[],""],
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_mg,[["rhs_mag_m67",1,1],["rhsusf_50Rnd_762x51_m62_tracer",4,50],["rhsusf_mag_15Rnd_9x19_JHP",2,15]]],
		[_backpack_med,[["rhsusf_50Rnd_762x51_m62_tracer",4,50]]],
		_helmet,
		_facewear,
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};

loadoutCC_AMG = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_rco,
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_r,_itemsV_base],
		[_backpack_med,[["rhsusf_50Rnd_762x51_m62_tracer",6,50]]],
		_helmet,
		_facewear,
		["ACE_Vector","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};

loadoutCC_AT = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_cco,
		_weap_at,
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_r,_itemsV_base],
		[_backpack_big,_mun_at],
		_helmet,
		_facewear,
		[],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};

loadoutCC_AAT = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_rco,
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_r,_itemsV_base],
		[_backpack_big,_mun_at],
		_helmet,
		_facewear,
		["ACE_Vector","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};

loadoutCC_DEMO = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_cco,
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_r,_itemsV_base],
		[_backpack_med,[["ACE_M26_Clacker",1],["ACE_DefusalKit",1],["ACE_EntrenchingTool",1],["SatchelCharge_Remote_Mag",1,1],["DemoCharge_Remote_Mag",2,1]]],
		_helmet,
		_facewear,
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};

loadoutCC_M = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_m14ebrri","",_lamp,"rhsusf_acc_LEUPOLDMK4",["rhsusf_20Rnd_762x51_m118_special_Mag",20],[],"rhsusf_acc_harris_bipod"],
		[],
		_pistol,
		[_uniform,(_itemsU_base + [["rhsusf_acc_acog3_usmc",1],["ACE_Kestrel4500",1],["ACE_RangeCard",1]])],
		[_vest_r,[["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",1,1],["rhsusf_20Rnd_762x51_m118_special_Mag",4,20],["rhsusf_20Rnd_762x51_m62_Mag",2,20],["rhsusf_mag_15Rnd_9x19_JHP",2,15]]],
		[],
		_helmet,
		_facewear,
		["ACE_Vector","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};

loadoutCC_GL = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_m16a4_carryhandle_M203","",_lamp,"rhsusf_acc_acog_usmc",["rhs_mag_30Rnd_556x45_M855A1_Stanag",30],["rhs_mag_M433_HEDP",1],""],
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_gl,[["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",2,1],["rhs_mag_30Rnd_556x45_M855A1_Stanag",7,30],["rhs_mag_M433_HEDP",4,1],["rhsusf_mag_15Rnd_9x19_JHP",2,15]]],
		[_backpack_med,[["rhs_mag_M433_HEDP",10,1],["rhs_mag_m713_Red",6,1],["rhs_mag_M585_white",6,1],["ACE_HandFlare_Green",2,1],["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",2,1]]],
		_helmet,
		_facewear,
		["ACE_Vector","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};

loadoutCC_A = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_rco,
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_r,_itemsV_base],
		[_backpack_med,[["rhs_mag_30Rnd_556x45_M855A1_Stanag",8,30],["rhs_mag_an_m8hc",2,1],["rhs_mag_m67",2,1],["ACE_HandFlare_Green",2,1]]],
		_helmet,
		_facewear,
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};

loadoutCC_LAT = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_rco,
		_weap_lat,
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_r,_itemsV_base],
		[],
		_helmet,
		_facewear,
		[],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};

loadoutCC_R = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_cco,
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_r,_itemsV_base],
		[],
		_helmet,
		_facewear,
		[],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};

loadoutCC_CREW = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_m4_cco,
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest_c,[["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",1,1],["rhs_mag_30Rnd_556x45_M855A1_Stanag",4,30],["rhsusf_mag_15Rnd_9x19_JHP",2,15]]],
		[],
		_helmet_crew,
		_facewear,
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};

loadoutCC_PILOT = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_m4_cco,
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest_c,[["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",1,1],["rhs_mag_30Rnd_556x45_M855A1_Stanag",4,30],["rhsusf_mag_15Rnd_9x19_JHP",2,15]]],
		[],
		"rhsusf_hgu56p",
		"",
		[],
		["ItemMap","","","ItemCompass","ACE_Altimeter",(if (dax_p_nvg > 0) then {"rhsusf_ANPVS_15"} else {""})]
	];
};

loadoutCC_SNIPER = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_m40a5","","rhsusf_acc_anpeq15side","rhsusf_acc_m8541_low",["rhsusf_5Rnd_762x51_AICS_m118_special_Mag",5],[],"rhsusf_acc_harris_swivel"],
		[],
		["rhsusf_weap_glock17g4","","acc_flashlight_pistol","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		[_uniform,_itemsU_tl],
		["rhsusf_spc_light",[["ACE_Kestrel4500",1],["ACE_RangeCard",1],["ACE_ATragMX",1],["rhs_mag_an_m8hc",2,1],["rhs_mag_m67",2,1],["rhsusf_5Rnd_762x51_AICS_m118_special_Mag",7,5],["rhsusf_mag_17Rnd_9x19_JHP",4,17]]],
		[_backpack_small,[["rhsusf_acc_su230a",1],["rhsusf_5Rnd_762x51_AICS_m993_Mag",8,5]]],
		_hat,
		_facewear,
		["Rangefinder","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",(if (dax_p_nvg > 0) then {"NVGoggles_OPFOR"} else {""})]
	];
};

loadoutCC_OBS = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_m4a1_carryhandle_mstock","rhsusf_acc_nt4_black","rhsusf_acc_anpeq16a","rhsusf_acc_acog_rmr",["rhs_mag_30Rnd_556x45_M855A1_Stanag",30],[],"rhsusf_acc_grip2"],
		[],
		["rhsusf_weap_glock17g4","","acc_flashlight_pistol","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		[_uniform,_itemsU_tl],
		[_vest_sl,[["ACE_Kestrel4500",1],["ACE_ATragMX",1],["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",1,1],["rhs_mag_30Rnd_556x45_M855A1_Stanag",7,30],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
		[_backpack_med,[]],
		_hat,
		_facewear,
		["Rangefinder","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",(if (dax_p_nvg > 0) then {"NVGoggles_OPFOR"} else {""})]
	];
};

loadoutCC_JTAC = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_m4_rco,
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest_sl,[["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",2,1],["rhs_mag_30Rnd_556x45_M855A1_Stanag",7,30],["rhsusf_mag_15Rnd_9x19_JHP",2,15]]],
		[_backpack_small,[["ACRE_PRC117F",1],["SmokeShellGreen",4,1],["ACE_HandFlare_Green",1,1]]],
		_helmet,
		_facewear,
		["Laserdesignator_01_khk_F","","","",["Laserbatteries",1],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};
