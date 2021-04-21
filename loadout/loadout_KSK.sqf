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
	_nvg = "";
	_lamp = "";
	_mag = "";
	_mag_ar = "";
	_mag_dmr = "";
	_weap_1 = [];
	_weap_2 = [];
	_weap_3 = [];
	_weap_4 = [];
	_weap_5 = [];
	_weap_lat = [];
	_weap_at = [];
	_mun_at = [];
	_facewear =  "";

	switch (dax_p_nvg) do {
		case 0: {_nvg = ""; _lamp = "";};
		case 1: {_nvg = "CUP_NVG_PVS15_black"; _lamp = "cup_acc_anpeq_15_black";};
		case 2: {_nvg = ""; _lamp = "cup_acc_xm8_light_module";};
		default {_nvg = ""; _lamp = "";};
	};
	
	switch (dax_loadoutcamo) do {
		case "desert": {
			_uniform = selectrandom ["CUP_U_B_GER_Tropentarn_2","CUP_U_B_GER_Tropentarn_1"];
			_backpack_big = "B_Carryall_cbr";
			_backpack_med = "B_Kitbag_cbr";
			_backpack_small = "B_AssaultPack_rgr";
			_helmet = selectrandom ["H_ShemagOpen_khk","H_ShemagOpen_tan"];
			_mag = "CUP_30Rnd_556x45_G36_camo";
			_mag_ar = "CUP_100Rnd_556x45_BetaCMag_camo";
			_mag_dmr = "CUP_20Rnd_762x51_HK417_Camo_Desert";
			_weap_1 = ["CUP_arifle_G36K_VFG_camo","cup_muzzle_snds_m16_desert",_lamp,"",[_mag,30],[],""];
			_weap_2 = ["CUP_arifle_G36K_RIS_camo","cup_muzzle_snds_m16_desert",_lamp,"cup_optic_compm2_low_coyote",[_mag,30],[],""];
			_weap_3 = ["CUP_arifle_G36K_AG36_camo","cup_muzzle_snds_m16_desert",_lamp,"",[_mag,30],["CUP_1Rnd_HEDP_M203",1],""];
			_weap_4 = ["CUP_arifle_G36K_RIS_camo","cup_muzzle_snds_m16_desert",_lamp,"cup_optic_compm2_low_coyote",[_mag_ar,100],[],""];
			_weap_5 = ["CUP_arifle_HK417_20_Desert","muzzle_snds_b_snd_f",_lamp,"cup_optic_sb_11_4x20_pm",[_mag_dmr,20],[],"bipod_01_f_snd"];
		};
		case "winter";
		case "jungle";
		case "woodland";
		case "polyvalent";
		default {
			_uniform = selectrandom ["CUP_U_B_GER_Flecktarn_2","CUP_U_B_GER_Flecktarn_1"];
			_backpack_big = "B_Carryall_oli";
			_backpack_med = "B_Kitbag_rgr";
			_backpack_small = "B_AssaultPack_khk";
			_helmet = selectrandom ["H_Shemag_olive","H_ShemagOpen_tan"];
			_mag = "CUP_30Rnd_556x45_G36";
			_mag_ar = "CUP_100Rnd_556x45_BetaCMag";
			_mag_dmr = "CUP_20Rnd_762x51_HK417";
			_weap_1 = ["CUP_arifle_G36K_VFG","cup_muzzle_snds_m16",_lamp,"cup_optic_g36dualoptics",[_mag,30],[],""];
			_weap_2 = ["CUP_arifle_G36K_RIS","cup_muzzle_snds_m16",_lamp,"cup_optic_compm2_low",[_mag,30],[],""];
			_weap_3 = ["CUP_arifle_G36K_AG36","cup_muzzle_snds_m16",_lamp,"cup_optic_g36dualoptics",[_mag,30],["CUP_1Rnd_HEDP_M203",1],""];
			_weap_4 = ["CUP_arifle_G36K_RIS","cup_muzzle_snds_m16",_lamp,"cup_optic_compm2_low",[_mag_ar,100],[],""];
			_weap_5 = ["CUP_arifle_HK417_20","muzzle_snds_b",_lamp,"cup_optic_sb_11_4x20_pm",[_mag_dmr,20],[],"bipod_01_f_blk"];
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
		_facewear = selectRandomWeighted ["G_Shades_Red",0.3,"G_Shades_Green",0.3,"G_Shades_Black",0.3,"",0.9];
	} else {
		_facewear = "";
	};

	_vest = selectrandom ["CUP_V_B_GER_Carrier_Vest_3","CUP_V_B_GER_Carrier_Vest"];
	_pistol = ["CUP_hgun_Glock17","","cup_acc_cz_m3x","",["CUP_17Rnd_9x19_glock17",17],[],""];

	_itemsU_base = [["ACE_fieldDressing",4],["ACE_tourniquet",1],["ACE_EarPlugs",1],["ACE_Flashlight_MX991",1],["ACRE_PRC343",1],["ACE_CableTie",1],["ACE_IR_Strobe_Item",1]];
	_itemsU_tl = _itemsU_base + [["ACRE_PRC148",1],["ACE_microDAGR",1],["ACE_MapTools",1]];
	_itemsV_base = [["CUP_HandGrenade_M67",2,1],["SmokeShell",2,1],[_mag,6,30],["CUP_17Rnd_9x19_glock17",2,17]];
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
		_weap_2,
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest,[["CUP_HandGrenade_M67",1,1],["SmokeShellGreen",4,1],[_mag,6,30],["CUP_17Rnd_9x19_glock17",2,17]]],
		[_backpack_med,[["ACRE_PRC117F",1],["SmokeShellPurple",2,1]]],
		_helmet,
		_facewear,
		["ACE_Vector","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};


loadoutCC_TL = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_1,
		_weap_lat,
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest,[["CUP_HandGrenade_M67",1,1],["SmokeShellGreen",4,1],[_mag,6,30],["CUP_17Rnd_9x19_glock17",2,17]]],
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
		_weap_2,
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest,_itemsV_base],
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
		_weap_4,
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest,[["CUP_HandGrenade_M67",2,1],["SmokeShell",2,1],[_mag_ar,1,100],["CUP_17Rnd_9x19_glock17",2,17]]],
		[_backpack_small,[[_mag_ar,3,100]]],
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
		_weap_1,
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest,_itemsV_base],
		[_backpack_med,[[_mag_ar,6,100]]],
		_helmet,
		_facewear,
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};
loadoutCC_MG = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["CUP_lmg_MG3_rail","",_lamp,"cup_optic_elcanm145",["CUP_120Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",120],[],""],
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest,[["CUP_HandGrenade_M67",2,1],["SmokeShell",2,1],["CUP_120Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",1,120],["CUP_17Rnd_9x19_glock17",2,17]]],
		[_backpack_small,[["CUP_120Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",2,120]]],
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
		_weap_1,
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest,_itemsV_base],
		[_backpack_med,[["CUP_120Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",4,120]]],
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
		_weap_2,
		_weap_at,
		_pistol,
		[_uniform,_itemsU_base],
		[_vest,_itemsV_base],
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
		_weap_1,
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest,_itemsV_base],
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
		_weap_2,
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest,_itemsV_base],
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
		_weap_5,
		[],
		_pistol,
		[_uniform,(_itemsU_base + [["ACE_Kestrel4500",1],["ACE_RangeCard",1]])],
		[_vest,[["CUP_HandGrenade_M67",2,1],["SmokeShell",2,1],[_mag_dmr,5,20],["CUP_17Rnd_9x19_glock17",2,17]]],
		[_backpack_small,[[_mag_dmr,6,20],["CUP_optic_AN_PAS_13c2",1]]],
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
		_weap_3,
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest,[["CUP_HandGrenade_M67",2,1],["SmokeShell",2,1],[_mag,4,30],["CUP_1Rnd_HEDP_M203",4,1],["CUP_17Rnd_9x19_glock17",2,17]]],
		[_backpack_med,[["CUP_1Rnd_HEDP_M203",10,1],["CUP_1Rnd_SmokeRed_M203",6,1],["CUP_1Rnd_StarCluster_White_M203",6,1],["ACE_HandFlare_Green",2,1],["CUP_HandGrenade_M67",2,1],["SmokeShell",2,1],[_mag,5,30]]],
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
		_weap_1,
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest,_itemsV_base],
		[_backpack_med,[[_mag,8,30],["SmokeShell",2,1],["CUP_HandGrenade_M67",2,1],["ACE_HandFlare_Green",2,1]]],
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
		_weap_2,
		_weap_lat,
		_pistol,
		[_uniform,_itemsU_base],
		[_vest,_itemsV_base],
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
		_weap_1,
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest,_itemsV_base],
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
		_weap_2,
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest,[["CUP_HandGrenade_M67",2,1],["SmokeShell",2,1],[_mag,5,30],["CUP_17Rnd_9x19_glock17",2,17]]],
		[],
		"H_HelmetCrew_I",
		_facewear,
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};

loadoutCC_PILOT = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_2,
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest,[["CUP_HandGrenade_M67",1,1],["SmokeShell",1,1],[_mag,5,30],["CUP_17Rnd_9x19_glock17",2,17]]],
		[],
		"H_PilotHelmetHeli_B",
		"",
		[],
		["ItemMap","","","ItemCompass","ACE_Altimeter",(if (dax_p_nvg > 0) then {"CUP_NVG_PVS7"} else {""})]
	];
};

loadoutCC_SNIPER = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		[(if (dax_loadoutcamo == "desert") then {"CUP_srifle_G22_des"} else {"CUP_srifle_G22_wdl"}),"","","cup_optic_leupold_vx3",["CUP_5Rnd_762x67_G22",5],[],"bipod_01_f_blk"],
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest,[["ACE_Kestrel4500",1],["ACE_RangeCard",1],["ACE_ATragMX",1],["SmokeShell",1,1],["CUP_HandGrenade_M67",1,1],["CUP_5Rnd_762x51_M24",7,5],["CUP_17Rnd_9x19_glock17",4,17]]],
		[_backpack_small,[["cup_optic_an_pvs_4",1]]],
		_helmet,
		_facewear,
		["Rangefinder","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",(if (dax_p_nvg > 0) then {"CUP_NVG_PVS15_black"} else {""})]
	];
};

loadoutCC_OBS = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_1,
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest,[["ACE_Kestrel4500",1],["ACE_ATragMX",1],["CUP_HandGrenade_M67",2,1],["SmokeShell",2,1],[_mag,6,30],["CUP_17Rnd_9x19_glock17",2,17]]],
		[],
		_helmet,
		_facewear,
		["Rangefinder","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",(if (dax_p_nvg > 0) then {"CUP_NVG_PVS15_black"} else {""})]
	];
};

loadoutCC_JTAC = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_2,
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest,[["CUP_HandGrenade_M67",1,1],["SmokeShellGreen",4,1],[_mag,6,30],["CUP_17Rnd_9x19_glock17",2,17]]],
		[_backpack_med,[["ACRE_PRC117F",1],["SmokeShellGreen",4,1],["ACE_HandFlare_Green",1,1]]],
		_helmet,
		_facewear,
		["Laserdesignator","","","",["Laserbatteries",1],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};