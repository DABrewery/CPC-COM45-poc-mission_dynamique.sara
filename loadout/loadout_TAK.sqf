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
	_nvg = "";
	_lamp = "";
	_weap_lat = [];
	_weap_at = [];
	_mun_at = [];
	_facewear =  "";

	switch (dax_p_nvg) do {
		case 0: {_nvg = ""; _lamp = "";};
		case 1: {_nvg = "CUP_NVG_HMNVS"; _lamp = "cup_acc_flashlight";};
		case 2: {_nvg = ""; _lamp = "cup_acc_flashlight";};
		default {_nvg = ""; _lamp = "";};
	};
	
	switch (dax_loadoutcamo) do {
		case "jungle";
		case "woodland";
		case "winter";
		case "desert";
		case "polyvalent";
		default {

		};
	};
	switch (cc_rhsennemy) do {
		case false: {
			_weap_lat = ["CUP_launch_RPG18","","","",[],[],""];
			_weap_at = ["CUP_launch_RPG7V","","","cup_optic_pgo7v3",["CUP_PG7V_M",1],[],""];
			_mun_at = ["CUP_B_RPGPack_Khaki",[["CUP_PG7V_M",3,1]]];
		};
		case true;
		default {
			_weap_lat = ["rhs_weap_rpg26","","","",[],[],""];
			_weap_at = ["rhs_weap_rpg7","","","rhs_acc_pgo7v3",["rhs_rpg7_PG7V_mag",1],[],""];
			_mun_at = ["CUP_B_RPGPack_Khaki",[["rhs_rpg7_PG7V_mag",3,1]]];
		};
	};

	
	_uniform = selectrandom ["CUP_U_O_TK_Green","CUP_U_O_TK_MixedCamo"];
	_backpack_2 = "CUP_B_CivPack_WDL";
	_backpack_1 = "CUP_B_AlicePack_Khaki";
	_helmet = "CUP_H_TK_Helmet";
	_hat = "CUP_H_TK_Lungee";
	_vest_1 = "CUP_V_O_TK_Vest_1";
	_vest_2 = "CUP_V_O_TK_Vest_2";
	_facewear = selectrandom ["CUP_TK_NeckScarf","CUP_FR_NeckScarf","CUP_FR_NeckScarf2"];

	_mag = "CUP_20Rnd_762x51_FNFAL_M";
	_weap = ["CUP_arifle_IMI_Romat","","","",[_mag,20],[],""];
	_pistol = ["CUP_hgun_Makarov","","","",["CUP_8Rnd_9x18_Makarov_M",8],[],""];

	_itemsU_base = [["ACE_fieldDressing",4],["ACE_tourniquet",1],["ACE_EarPlugs",1],["ACE_Flashlight_KSF1",1],["ACRE_PRC343",1],["ACE_CableTie",1]];
	_itemsU_tl = _itemsU_base + [["ACRE_PRC148",1],["ACE_MapTools",1]];
	_itemsV_base = [["CUP_HandGrenade_RGD5",2,1],["SmokeShell",2,1],[_mag,9,20]];
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
		["CUP_arifle_AKS74U","","","",["CUP_30Rnd_545x39_AK_M",30],[],""],
		[],
		_pistol,
		["CUP_U_O_TK_Officer",_itemsU_tl],
		["CUP_V_O_TK_OfficerBelt2",[["CUP_HandGrenade_RGD5",1,1],["SmokeShellGreen",4,1],["CUP_30Rnd_545x39_AK_M",2,30],["CUP_8Rnd_9x18_Makarov_M",1,8]]],
		[_backpack_2,[["ACRE_PRC117F",1],["SmokeShellPurple",2,1]]],
		"CUP_H_TK_Beret",
		(if (dax_p_nvg > 0) then {"G_Aviator"} else {""}),
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};


loadoutCC_TL = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["CUP_arifle_IMI_Romat_railed","","","cup_optic_susat",[_mag,20],[],""],
		_weap_lat,
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest_1,[["CUP_HandGrenade_RGD5",2,1],["SmokeShell",2,1],["SmokeShellGreen",2,1],[_mag,9,20],["CUP_8Rnd_9x18_Makarov_M",2,8]]],
		[],
		_helmet,
		_facewear,
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_DOC = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap,
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest_2,_itemsV_base],
		["CUP_B_TK_Medic_Desert",_itemsB_medic],
		_helmet,
		_facewear,
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_AR = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["CUP_arifle_RPK74","",_lamp,"",["CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M",75],[],""],
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest_1,[["CUP_HandGrenade_RGD5",2,1],["SmokeShell",2,1],["CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M",4,75]]],
		[_backpack_2,[["CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M",5,75]]],
		_helmet,
		_facewear,
		[],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_AAR = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap,
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest_1,_itemsV_base],
		[_backpack_2,[["CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M",5,75]]],
		_helmet,
		_facewear,
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};
loadoutCC_MG = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["CUP_lmg_PKM","","","",["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",100],[],""],
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest_1,[["CUP_HandGrenade_RGD5",2,1],["SmokeShell",2,1],["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",2,100]]],
		[_backpack_2,[["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",1,100]]],
		_helmet,
		_facewear,
		["","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_AMG = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap,
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest_1,_itemsV_base],
		[_backpack_2,[["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",4,100]]],
		_helmet,
		_facewear,
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_AT = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap,
		_weap_at,
		[],
		[_uniform,_itemsU_base],
		[_vest_2,_itemsV_base],
		_mun_at,
		_helmet,
		_facewear,
		["","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_AAT = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap,
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest_2,_itemsV_base],
		_mun_at,
		_helmet,
		_facewear,
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_DEMO = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap,
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest_1,_itemsV_base],
		[_backpack_1,[["ACE_M26_Clacker",1],["ACE_DefusalKit",1],["ACE_EntrenchingTool",1],["SatchelCharge_Remote_Mag",1,1],["DemoCharge_Remote_Mag",2,1]]],
		_helmet,
		_facewear,
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_M = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["CUP_srifle_SVD","","","cup_optic_pso_1",["CUP_10Rnd_762x54_SVD_M",10],[],""],
		[],
		[],
		[_uniform,(_itemsU_base + [["cup_optic_nspu",1],["ACE_Kestrel4500",1],["ACE_RangeCard",1]])],
		[_vest_1,[["CUP_HandGrenade_RGD5",2,1],["SmokeShell",2,1],["CUP_10Rnd_762x54_SVD_M",9,10]]],
		[],
		_helmet,
		_facewear,
		["","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_GL = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["CUP_arifle_M16A2_GL","","","",["CUP_30Rnd_556x45_Stanag",30],["CUP_1Rnd_HE_M203",1],""],
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest_1,[["CUP_HandGrenade_RGD5",2,1],["SmokeShell",2,1],["CUP_30Rnd_556x45_Stanag",7,30],["CUP_1Rnd_HE_M203",4,1]]],
		[_backpack_1,[["CUP_1Rnd_HE_M203",10,1],["CUP_1Rnd_SmokeRed_M203",6,1],["CUP_1Rnd_StarFlare_White_M203",6,1],["ACE_HandFlare_Green",2,1],["CUP_HandGrenade_RGD5",2,1],["SmokeShell",2,1]]],
		_helmet,
		_facewear,
		["","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_A = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap,
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest_1,_itemsV_base],
		[_backpack_2,[[_mag,8,20],["SmokeShell",2,1],["CUP_HandGrenade_RGD5",2,1],["ACE_HandFlare_Green",2,1]]],
		_helmet,
		_facewear,
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_LAT = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap,
		_weap_lat,
		[],
		[_uniform,_itemsU_base],
		[_vest_1,_itemsV_base],
		[],
		_helmet,
		_facewear,
		[],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_R = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap,
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest_1,_itemsV_base],
		[],
		_helmet,
		_facewear,
		[],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_CREW = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["CUP_arifle_AKS74U","","","",["CUP_30Rnd_545x39_AK_M",30],[],""],
		[],
		[],
		["CUP_U_O_SLA_Overalls_Tank",_itemsU_tl],
		["CUP_V_O_SLA_M23_1_OD",[["CUP_HandGrenade_RGD5",2,1],["SmokeShell",2,1],["CUP_30Rnd_545x39_AK_M",5,30]]],
		[],
		"CUP_H_TK_TankerHelmet",
		_facewear,
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_PILOT = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["CUP_arifle_AKS74U","","","",["CUP_30Rnd_545x39_AK_M",30],[],""],
		[],
		[],
		["CUP_U_O_SLA_Overalls_Pilot",_itemsU_tl],
		["CUP_V_O_SLA_M23_1_BRN",[["CUP_HandGrenade_RGD5",2,1],["SmokeShell",2,1],["CUP_30Rnd_545x39_AK_M",5,30]]],
		[],
		"CUP_H_RUS_ZSH_Shield_Up",
		"",
		[],
		["ItemMap","","","ItemCompass","ItemWatch",(if (dax_p_nvg > 0) then {_nvg} else {""})]
	];
};

loadoutCC_SNIPER = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["CUP_srifle_ksvk","","","cup_optic_pso_3",["CUP_5Rnd_127x108_KSVK_M",5],[],""],
		[],
		["CUP_hgun_PB6P9","cup_muzzle_pb6p9","","",["CUP_8Rnd_9x18_MakarovSD_M",8],[],""],
		[_uniform,_itemsU_tl],
		[_vest_1,[["ACE_RangeCard",1],["SmokeShell",2,1],["CUP_HandGrenade_RGD5",2,1],["CUP_5Rnd_127x108_KSVK_M",3,5],["CUP_8Rnd_9x18_MakarovSD_M",4,8]]],
		[_backpack_1,[["cup_optic_nspu",1],["CUP_5Rnd_127x108_KSVK_M",2,5]]],
		_hat,
		_facewear,
		["ACE_Vector","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",(if (dax_p_nvg > 0) then {"CUP_NVG_HMNVS"} else {""})]
	];
};

loadoutCC_OBS = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["CUP_arifle_AKS74U","cup_muzzle_pbs4","","",["CUP_30Rnd_545x39_AK_M",30],[],""],
		[],
		["CUP_hgun_PB6P9","cup_muzzle_pb6p9","","",["CUP_8Rnd_9x18_MakarovSD_M",8],[],""],
		[_uniform,_itemsU_tl],
		[_vest_1,[["CUP_HandGrenade_RGD5",2,1],["SmokeShell",2,1],["CUP_30Rnd_545x39_AK_M",7,30],["CUP_8Rnd_9x18_MakarovSD_M",2,8]]],
		[_backpack_1,[]],
		_hat,
		_facewear,
		["ACE_Vector","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",(if (dax_p_nvg > 0) then {"CUP_NVG_HMNVS"} else {""})]
	];
};

loadoutCC_JTAC = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap,
		[],
		[],
		[_uniform,_itemsU_tl],
		[_vest_1,_itemsV_base],
		[_backpack_2,[["ACRE_PRC117F",1],["SmokeShellGreen",4,1],["ACE_HandFlare_Green",1,1]]],
		_helmet,
		_facewear,
		["CUP_SOFLAM","","","",["Laserbatteries",1],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};
