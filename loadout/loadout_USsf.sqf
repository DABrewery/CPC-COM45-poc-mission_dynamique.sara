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
	_hat = "";
	_nvg = "";
	_lamp = "";
	_weap_lat = [];
	_weap_at = [];
	_mun_at = [];
	_weap = "";
	_weap_r = [];
	_weap_r2 = [];
	_weap_tl = [];
	_weap_m = [];
	_weap_sniper = [];
	_facewear =  "";

	switch (dax_p_nvg) do {
		case 0: {_nvg = ""; _lamp = "";};
		case 1: {_nvg = "rhsusf_ANPVS_15"; _lamp = "rhsusf_acc_anpeq16a";};
		case 2: {_nvg = ""; _lamp = "rhsusf_acc_wmx_bk";};
		default {_nvg = ""; _lamp = "";};
	};
	
	switch (dax_loadoutcamo) do {
		case "winter": {
			_uniform = "rhs_uniform_g3_m81";
			_backpack_big = selectRandom ["B_Carryall_cbr","B_Carryall_khk"];
			_backpack_med = selectRandom ["B_Kitbag_mcamo","B_Kitbag_cbr"];
			_backpack_small = selectRandom ["B_AssaultPack_cbr","rhsusf_falconii_mc"];
			_helmet = selectRandom ["rhsusf_opscore_paint_pelt","rhsusf_opscore_paint_pelt_nsw","rhsusf_opscore_ut_pelt","rhsusf_opscore_ut_pelt_nsw"];
			_hat = "H_Booniehat_khk";
			_weap = selectRandom ["rhs_weap_mk18","rhs_weap_mk18_KAC"];
			_weap_r = [_weap,"rhsusf_acc_nt4_tan",_lamp,(selectRandom ["rhsusf_acc_su230_c","rhsusf_acc_su230"]),["rhs_mag_30Rnd_556x45_M855A1_PMAG",30],[],"rhsusf_acc_grip2"];
			_weap_r2 = [_weap,"rhsusf_acc_nt4_tan",_lamp,(selectRandom ["rhsusf_acc_eotech_xps3","rhsusf_acc_rx01_nofilter","rhsusf_acc_rx01_nofilter_tan","rhsusf_acc_t1_high"]),["rhs_mag_30Rnd_556x45_M855A1_PMAG",30],[],"rhsusf_acc_grip2"];
			_weap_tl = [_weap,"rhsusf_acc_nt4_tan",_lamp,(selectRandom ["rhsusf_acc_su230_mrds","rhsusf_acc_su230_mrds_c"]),["rhs_mag_30Rnd_556x45_M855A1_PMAG",30],[],"rhsusf_acc_grip2"];
			_weap_m = ["rhs_weap_sr25_ec","rhsusf_acc_sr25s",_lamp,"rhsusf_acc_su230a_mrds",["rhsusf_20Rnd_762x51_SR25_m118_special_Mag",20],[],"rhsusf_acc_harris_bipod"];
			_weap_sniper = ["rhs_weap_XM2010_wd","rhsusf_acc_m2010s_wd","","rhsusf_acc_leupoldmk4_2",["rhsusf_5Rnd_300winmag_xm2010",5],[],"rhsusf_acc_harris_bipod"];
		};
		case "woodland": {
			_uniform = "rhs_uniform_g3_m81";
			_backpack_big = selectRandom ["B_Carryall_cbr","B_Carryall_khk","B_Carryall_oli"];
			_backpack_med = selectRandom ["B_Kitbag_mcamo","B_Kitbag_rgr"];
			_backpack_small = selectRandom ["B_AssaultPack_rgr","rhsusf_falconii_mc"];
			_helmet = selectRandom ["rhsusf_opscore_ut_pelt_nsw","rhsusf_opscore_ut_pelt","rhsusf_opscore_rg_cover_pelt","rhsusf_opscore_paint_pelt_nsw","rhsusf_opscore_paint_pelt","rhsusf_opscore_fg_pelt_nsw","rhsusf_opscore_fg_pelt"];
			_hat = "rhs_Booniehat_m81";
			_weap = selectRandom ["rhs_weap_mk18","rhs_weap_mk18_KAC"];
			_weap_r = [_weap,"rhsusf_acc_nt4_tan",_lamp,(selectRandom ["rhsusf_acc_su230_c","rhsusf_acc_su230"]),["rhs_mag_30Rnd_556x45_M855A1_PMAG",30],[],"rhsusf_acc_grip2"];
			_weap_r2 = [_weap,"rhsusf_acc_nt4_tan",_lamp,(selectRandom ["rhsusf_acc_eotech_xps3","rhsusf_acc_rx01_nofilter","rhsusf_acc_rx01_nofilter_tan","rhsusf_acc_t1_high"]),["rhs_mag_30Rnd_556x45_M855A1_PMAG",30],[],"rhsusf_acc_grip2"];
			_weap_tl = [_weap,"rhsusf_acc_nt4_tan",_lamp,(selectRandom ["rhsusf_acc_su230_mrds","rhsusf_acc_su230_mrds_c"]),["rhs_mag_30Rnd_556x45_M855A1_PMAG",30],[],"rhsusf_acc_grip2"];
			_weap_m = ["rhs_weap_sr25_ec","rhsusf_acc_sr25s",_lamp,"rhsusf_acc_su230a_mrds",["rhsusf_20Rnd_762x51_SR25_m118_special_Mag",20],[],"rhsusf_acc_harris_bipod"];
			_weap_sniper = ["rhs_weap_XM2010_wd","rhsusf_acc_m2010s_wd","","rhsusf_acc_leupoldmk4_2",["rhsusf_5Rnd_300winmag_xm2010",5],[],"rhsusf_acc_harris_bipod"];
		};
		case "desert": {
			_uniform = "rhs_uniform_g3_tan";
			_backpack_big = selectRandom ["B_Carryall_cbr","B_Carryall_khk","B_Carryall_mcamo"];
			_backpack_med = selectRandom ["B_Kitbag_mcamo","B_Kitbag_cbr"];
			_backpack_small = selectRandom ["rhsusf_falconii_coy","rhsusf_falconii_mc","B_AssaultPack_cbr"];
			_helmet = selectRandom ["rhsusf_opscore_ut_pelt_nsw","rhsusf_opscore_ut_pelt","rhsusf_opscore_paint_pelt_nsw","rhsusf_opscore_paint_pelt","rhsusf_opscore_mc_pelt_nsw","rhsusf_opscore_mc_pelt","rhsusf_opscore_coy_cover_pelt"];
			_hat = "H_Booniehat_tan";
			_weap = selectRandom ["rhs_weap_mk18_d","rhs_weap_mk18_KAC_d"];
			_weap_r = [_weap,"rhsusf_acc_nt4_tan",_lamp,"rhsusf_acc_su230_c",["rhs_mag_30Rnd_556x45_M855A1_PMAG",30],[],"rhsusf_acc_grip2"];
			_weap_r2 = [_weap,"rhsusf_acc_nt4_tan",_lamp,(selectRandom ["rhsusf_acc_eotech_xps3","rhsusf_acc_eotech_552_d","rhsusf_acc_rx01_nofilter_tan","rhsusf_acc_t1_high"]),["rhs_mag_30Rnd_556x45_M855A1_PMAG",30],[],"rhsusf_acc_grip2"];
			_weap_tl = [_weap,"rhsusf_acc_nt4_tan",_lamp,"rhsusf_acc_su230_mrds_c",["rhs_mag_30Rnd_556x45_M855A1_PMAG",30],[],"rhsusf_acc_grip2"];
			_weap_m = ["rhs_weap_sr25_ec_d","rhsusf_acc_sr25s_d",_lamp,"rhsusf_acc_su230a_mrds_c",["rhsusf_20Rnd_762x51_SR25_m118_special_Mag",20],[],"rhsusf_acc_harris_bipod"];
			_weap_sniper = ["rhs_weap_XM2010_d","rhsusf_acc_m2010s_d","","rhsusf_acc_leupoldmk4_2_d",["rhsusf_5Rnd_300winmag_xm2010",5],[],"rhsusf_acc_harris_bipod"];
		};
		case "jungle": {
			_uniform = "rhs_uniform_g3_rgr";
			_backpack_big = selectRandom ["B_Carryall_khk","B_Carryall_oli"];
			_backpack_med = selectRandom ["B_Kitbag_mcamo","B_Kitbag_rgr"];
			_backpack_small = selectRandom ["B_AssaultPack_khk","B_AssaultPack_rgr","rhsusf_falconii_mc","rhsusf_falconii"];
			_helmet = selectRandom ["rhsusf_opscore_rg_cover_pelt","rhsusf_opscore_paint_pelt_nsw","rhsusf_opscore_paint_pelt","rhsusf_opscore_fg_pelt_nsw","rhsusf_opscore_fg_pelt"];
			_hat = "H_Booniehat_oli";
			_weap = selectRandom ["rhs_weap_mk18_wd","rhs_weap_mk18_KAC_wd"];
			_weap_r = [_weap,"rhsusf_acc_nt4_tan",_lamp,"rhsusf_acc_su230",["rhs_mag_30Rnd_556x45_M855A1_PMAG",30],[],"rhsusf_acc_grip2_wd"];
			_weap_r2 = [_weap,"rhsusf_acc_nt4_tan",_lamp,(selectRandom ["rhsusf_acc_eotech_xps3","rhsusf_acc_rx01_nofilter","rhsusf_acc_eotech_552_wd","rhsusf_acc_t1_high"]),["rhs_mag_30Rnd_556x45_M855A1_PMAG",30],[],"rhsusf_acc_grip2_wd"];
			_weap_tl = [_weap,"rhsusf_acc_nt4_tan",_lamp,"rhsusf_acc_su230_mrds",["rhs_mag_30Rnd_556x45_M855A1_PMAG",30],[],"rhsusf_acc_grip2_wd"];
			_weap_m = ["rhs_weap_sr25_ec_wd","rhsusf_acc_sr25s_wd",_lamp,"rhsusf_acc_su230a_mrds",["rhsusf_20Rnd_762x51_SR25_m118_special_Mag",20],[],"rhsusf_acc_harris_bipod"];
			_weap_sniper = ["rhs_weap_XM2010_wd","rhsusf_acc_m2010s_wd","","rhsusf_acc_leupoldmk4_2",["rhsusf_5Rnd_300winmag_xm2010",5],[],"rhsusf_acc_harris_bipod"];
		};
		case "polyvalent";
		default {
			_uniform = "rhs_uniform_g3_mc";
			_backpack_big = selectRandom ["B_Carryall_mcamo","B_Carryall_cbr","B_Carryall_khk"];
			_backpack_med = selectRandom ["B_Kitbag_mcamo","B_Kitbag_rgr","B_Kitbag_cbr"];
			_backpack_small = selectRandom ["rhsusf_falconii_mc","rhsusf_falconii_coy","B_AssaultPack_mcamo","B_AssaultPack_cbr"];
			_helmet = selectRandom ["rhsusf_opscore_ut_pelt_nsw","rhsusf_opscore_ut_pelt","rhsusf_opscore_paint_pelt_nsw","rhsusf_opscore_paint_pelt","rhsusf_opscore_mc_pelt_nsw","rhsusf_opscore_mc_pelt","rhsusf_opscore_mc_cover_pelt_nsw","rhsusf_opscore_mc_cover_pelt"];
			_hat = "rhs_Booniehat_ocp";
			_weap = selectRandom ["rhs_weap_mk18","rhs_weap_mk18_KAC"];
			_weap_r = [_weap,"rhsusf_acc_nt4_tan",_lamp,(selectRandom ["rhsusf_acc_su230_c","rhsusf_acc_su230"]),["rhs_mag_30Rnd_556x45_M855A1_PMAG",30],[],"rhsusf_acc_grip2"];
			_weap_r2 = [_weap,"rhsusf_acc_nt4_tan",_lamp,(selectRandom ["rhsusf_acc_eotech_xps3","rhsusf_acc_rx01_nofilter","rhsusf_acc_rx01_nofilter_tan","rhsusf_acc_t1_high"]),["rhs_mag_30Rnd_556x45_M855A1_PMAG",30],[],"rhsusf_acc_grip2"];
			_weap_tl = [_weap,"rhsusf_acc_nt4_tan",_lamp,(selectRandom ["rhsusf_acc_su230_mrds","rhsusf_acc_su230_mrds_c"]),["rhs_mag_30Rnd_556x45_M855A1_PMAG",30],[],"rhsusf_acc_grip2"];
			_weap_m = ["rhs_weap_sr25_ec","rhsusf_acc_sr25s",_lamp,"rhsusf_acc_su230a_mrds",["rhsusf_20Rnd_762x51_SR25_m118_special_Mag",20],[],"rhsusf_acc_harris_bipod"];
			_weap_sniper = ["rhs_weap_XM2010_sa","rhsusf_acc_m2010s_sa","","rhsusf_acc_leupoldmk4_2",["rhsusf_5Rnd_300winmag_xm2010",5],[],"rhsusf_acc_harris_bipod"];
		};
	};
	switch (cc_rhsennemy) do {
		case false: {
			_weap_lat = ["CUP_launch_M136","","","",[],[],""];
			_weap_at = ["CUP_launch_MAAWS","","","cup_optic_maaws_scope",["CUP_MAAWS_HEAT_M",1],[],""];
			_mun_at = [["CUP_MAAWS_HEAT_M",2,1],["CUP_MAAWS_HEDP_M",1,1]];
		};
		case true;
		default {
			_weap_lat = ["rhs_weap_M136","","","",[],[],""];
			_weap_at = ["rhs_weap_maaws","","","rhs_optic_maaws",["rhs_mag_maaws_HEAT",1],[],""];
			_mun_at = [["rhs_mag_maaws_HEAT",2,1],["rhs_mag_maaws_HEDP",1,1]];
		};
	
	};

	if (dax_p_nvg < 1) then {
		_facewear = selectrandom ["CUP_TK_NeckScarf","CUP_FR_NeckScarf","CUP_FR_NeckScarf2","rhsusf_oakley_goggles_ylw","rhsusf_oakley_goggles_clr","rhsusf_oakley_goggles_blk","rhsusf_shemagh2_gogg_tan","rhsusf_shemagh_gogg_tan","rhsusf_shemagh2_gogg_od","rhsusf_shemagh_gogg_od","rhsusf_shemagh2_gogg_grn","rhsusf_shemagh_gogg_grn","rhsusf_shemagh2_tan","rhsusf_shemagh_tan","rhsusf_shemagh2_od","rhsusf_shemagh_od","rhsusf_shemagh2_grn","rhsusf_shemagh_grn","rhs_ess_black","rhs_googles_orange","rhs_googles_yellow","rhs_googles_clear","rhs_googles_black","G_Shades_Red","G_Shades_Green","G_Shades_Blue","G_Shades_Black"];
	} else {
		_facewear = selectrandom ["CUP_TK_NeckScarf","CUP_FR_NeckScarf","CUP_FR_NeckScarf2","rhsusf_shemagh2_tan","rhsusf_shemagh_tan","rhsusf_shemagh2_od","rhsusf_shemagh_od","rhsusf_shemagh2_grn","rhsusf_shemagh_grn"];
	};

	_vest = "rhsusf_mbav_rifleman";
	_vest_doc = "rhsusf_mbav_medic";
	_vest_mg = "rhsusf_mbav_mg";
	_vest_gl = "rhsusf_mbav_grenadier";
	_vest_light = "rhsusf_mbav_light";
	_itemsU_base = [["ACE_fieldDressing",4],["ACE_tourniquet",1],["ACE_EarPlugs",1],["ACE_Flashlight_MX991",1],["ACRE_PRC343",1],["ACE_CableTie",1],["ACE_IR_Strobe_Item",1],["rhs_mag_an_m8hc",1,1]];
	_itemsU_tl = [["ACRE_PRC148",1],["ACE_microDAGR",1],["ACE_MapTools",1]];
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
		_weap_r2,
		[],
		["rhsusf_weap_glock17g4","","acc_flashlight_pistol","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		[_uniform,(_itemsU_base + _itemsU_tl)],
		[_vest,[["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",1,1],["rhs_mag_m18_green",3,1],["rhs_mag_30Rnd_556x45_M855A1_PMAG",3,30],["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",4,30],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
		[_backpack_small,[["ACRE_PRC117F",1],["SmokeShellPurple",2,1]]],
		"rhsusf_Bowman",
		_facewear,
		["ACE_Vector","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",(if (dax_p_nvg == 1) then {"NVGoggles_OPFOR"} else {""})]
	];
};


loadoutCC_TL = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_tl,
		_weap_lat,
		["rhsusf_weap_glock17g4","","acc_flashlight_pistol","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		[_uniform,(_itemsU_base + _itemsU_tl)],
		[_vest,[["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",1,1],["rhs_mag_m18_green",3,1],["rhs_mag_30Rnd_556x45_M855A1_PMAG",3,30],["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",4,30],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
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
		_weap_r2,
		[],
		["rhsusf_weap_glock17g4","","acc_flashlight_pistol","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		[_uniform,_itemsU_base],
		[_vest_doc,[["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",4,1],["rhs_mag_30Rnd_556x45_M855A1_PMAG",7,30],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
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
		["rhs_weap_m249_pip_S_vfg","rhsusf_acc_rotex5_grey",_lamp,"rhsusf_acc_su230_mrds",["rhsusf_100Rnd_556x45_mixed_soft_pouch",100],[],"rhsusf_acc_grip1"],
		[],
		["rhsusf_weap_glock17g4","","acc_flashlight_pistol","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		[_uniform,_itemsU_base],
		[_vest_mg,[["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",1,1],["rhsusf_100Rnd_556x45_mixed_soft_pouch",3,100],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
		[_backpack_small,[["rhsusf_100Rnd_556x45_mixed_soft_pouch",4,100]]],
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
		_weap_r2,
		[],
		["rhsusf_weap_glock17g4","","acc_flashlight_pistol","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",1,1],["rhs_mag_30Rnd_556x45_M855A1_PMAG",7,30],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
		[_backpack_med,[["rhsusf_100Rnd_556x45_mixed_soft_pouch",6,100]]],
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
		["rhsusf_weap_glock17g4","","acc_flashlight_pistol","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		[_uniform,_itemsU_base],
		[_vest_mg,[["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",1,1],["rhsusf_50Rnd_762x51_m62_tracer",3,50],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
		[_backpack_small,[["rhsusf_50Rnd_762x51_m62_tracer",4,50]]],
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
		_weap_r,
		[],
		["rhsusf_weap_glock17g4","","acc_flashlight_pistol","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",1,1],["rhs_mag_30Rnd_556x45_M855A1_PMAG",7,30],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
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
		_weap_r2,
		_weap_at,
		["rhsusf_weap_glock17g4","","acc_flashlight_pistol","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",1,1],["rhs_mag_30Rnd_556x45_M855A1_PMAG",7,30],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
		[_backpack_big,_mun_at],
		_helmet,
		_facewear,
		["ACE_Vector","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};

loadoutCC_AAT = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r,
		[],
		["rhsusf_weap_glock17g4","","acc_flashlight_pistol","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",1,1],["rhs_mag_30Rnd_556x45_M855A1_PMAG",7,30],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
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
		_weap_r2,
		[],
		["rhsusf_weap_glock17g4","","acc_flashlight_pistol","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",1,1],["rhs_mag_30Rnd_556x45_M855A1_PMAG",7,30],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
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
		_weap_m,
		[],
		["rhsusf_weap_glock17g4","","acc_flashlight_pistol","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",1,1],["rhsusf_20Rnd_762x51_SR25_m118_special_Mag",5,20],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
		[_backpack_small,[["rhsusf_20Rnd_762x51_SR25_m62_Mag",6,20]]],
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
		["rhs_weap_mk18_m320","rhsusf_acc_nt4_tan",_lamp,"rhsusf_acc_su230",["rhs_mag_30Rnd_556x45_M855A1_PMAG",30],["rhs_mag_M433_HEDP",1],""],
		[],
		["rhsusf_weap_glock17g4","","acc_flashlight_pistol","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		[_uniform,_itemsU_base],
		[_vest_gl,[["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",1,1],["rhs_mag_30Rnd_556x45_M855A1_PMAG",7,30],["rhs_mag_M433_HEDP",4,1],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
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
		_weap_r,
		[],
		["rhsusf_weap_glock17g4","","acc_flashlight_pistol","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",1,1],["rhs_mag_30Rnd_556x45_M855A1_PMAG",7,30],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
		[_backpack_big,[["rhs_mag_30Rnd_556x45_M855A1_PMAG",8,30],["rhs_mag_an_m8hc",2,1],["rhs_mag_m67",2,1],["ACE_HandFlare_Green",2,1]]],
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
		_weap_r,
		_weap_lat,
		["rhsusf_weap_glock17g4","","acc_flashlight_pistol","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",1,1],["rhs_mag_30Rnd_556x45_M855A1_PMAG",7,30],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
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
		_weap_r2,
		[],
		["rhsusf_weap_glock17g4","","acc_flashlight_pistol","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",1,1],["rhs_mag_30Rnd_556x45_M855A1_PMAG",7,30],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
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
		_weap_r2,
		[],
		["rhsusf_weap_glock17g4","","acc_flashlight_pistol","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		[_uniform,(_itemsU_base + _itemsU_tl)],
		[_vest_light,[["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",1,1],["rhs_mag_30Rnd_556x45_M855A1_PMAG",5,30],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
		[],
		"rhsusf_cvc_green_alt_helmet",
		_facewear,
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};

loadoutCC_PILOT = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r2,
		[],
		["rhsusf_weap_glock17g4","","acc_flashlight_pistol","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		[_uniform,(_itemsU_base + _itemsU_tl)],
		[_vest_light,[["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",1,1],["rhs_mag_30Rnd_556x45_M855A1_PMAG",5,30],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
		[],
		"rhsusf_hgu56p",
		"",
		[],
		["ItemMap","","","ItemCompass","ACE_Altimeter",(if (dax_p_nvg > 0) then {"NVGoggles_OPFOR"} else {""})]
	];
};

loadoutCC_SNIPER = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_sniper,
		[],
		["rhsusf_weap_glock17g4","","acc_flashlight_pistol","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		[_uniform,(_itemsU_base + _itemsU_tl)],
		["V_TacVest_khk",[["ACE_Kestrel4500",1],["ACE_RangeCard",1],["ACE_ATragMX",1],["rhs_mag_m67",2,1],["rhsusf_5Rnd_300winmag_xm2010",5,5],["rhsusf_mag_17Rnd_9x19_JHP",4,17]]],
		[_backpack_small,[["rhsusf_acc_premier_anpvs27",1],["rhsusf_5Rnd_300winmag_xm2010",14,5]]],
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
		_weap_tl,
		[],
		["rhsusf_weap_glock17g4","","acc_flashlight_pistol","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		[_uniform,(_itemsU_base + _itemsU_tl)],
		[_vest,[["ACE_Kestrel4500",1],["ACE_ATragMX",1],["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",1,1],["rhs_mag_30Rnd_556x45_M855A1_PMAG",7,30],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
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
		_weap_r,
		[],
		["rhsusf_weap_glock17g4","","acc_flashlight_pistol","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		[_uniform,(_itemsU_base + _itemsU_tl)],
		[_vest,[["rhs_mag_m67",2,1],["rhs_mag_an_m8hc",1,1],["rhs_mag_30Rnd_556x45_M855A1_PMAG",7,30],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
		[_backpack_small,[["ACRE_PRC117F",1],["SmokeShellGreen",4,1],["ACE_HandFlare_Green",1,1]]],
		_helmet,
		_facewear,
		["Laserdesignator_01_khk_F","","","",["Laserbatteries",1],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};
