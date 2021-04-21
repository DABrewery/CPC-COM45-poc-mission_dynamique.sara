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
	_vest = "";
	_vest_r = "";
	_vest_tl = "";
	_vest_doc = "";
	_vest_m = "";
	_hat = "";
	_nvg = "";
	_lamp = "";
	_weap_lat = [];
	_weap_at = [];
	_mun_at = [];

	switch (dax_p_nvg) do {
		case 0: {_nvg = ""; _lamp = "";};
		case 1: {_nvg = ""; _lamp = "rhs_acc_2dpzenit_ris";};
		case 2: {_nvg = ""; _lamp = "rhs_acc_2dpzenit_ris";};
		default {_nvg = ""; _lamp = "";};
	};
	
	switch (dax_loadoutcamo) do {
		case "desert": {
			_uniform = "rhs_uniform_m88_patchless";
			_vest = "rhs_6b5_khaki";
			_vest_r = "rhs_6b5_rifleman_khaki";
			_vest_tl = "rhs_6b5_officer_khaki";
			_vest_doc = "rhs_6b5_medic_khaki";
			_vest_m = "rhs_6b5_sniper_khaki";
			_hat = "rhs_fieldcap_khk";
		};
		case "woodland";
		case "jungle";
		case "winter";
		case "polyvalent";
		default {
			_uniform = "rhsgref_uniform_vsr";
			_vest = "rhs_6b5";
			_vest_r = "rhs_6b5_rifleman";
			_vest_tl = "rhs_6b5_officer";
			_vest_doc = "rhs_6b5_medic";
			_vest_m = "rhs_6b5_sniper";
			_hat = "rhs_fieldcap_vsr";
		};
	};
	switch (cc_rhsennemy) do {
		case false: {
			_weap_lat = ["CUP_launch_RPG18","","","",[],[],""];
			_weap_at = ["CUP_launch_RPG7V","","","cup_optic_pgo7v3",["CUP_PG7V_M",1],[],""];
			_mun_at = ["rhs_rpg_empty",[["CUP_PG7V_M",2,1]]];
		};
		case true;
		default {
			_weap_lat = ["rhs_weap_rpg26","","","",[],[],""];
			_weap_at = ["rhs_weap_rpg7","","","rhs_acc_pgo7v3",["rhs_rpg7_PG7V_mag",1],[],""];
			_mun_at = ["rhs_rpg_empty",[["rhs_rpg7_PG7V_mag",4,1]]];
		};
	
	};

	_helmet = "rhs_ssh68";
	_backpack = "rhs_sidor";
	_weap = ["CUP_arifle_AK74_Early","",_lamp,"",["CUP_30Rnd_545x39_AK_M",30],[],""];
	_weap_2 = ["CUP_arifle_AKS74_Early","",_lamp,"",["CUP_30Rnd_545x39_AK_M",30],[],""];
	_pistol = ["CUP_hgun_Makarov","","","",["CUP_8Rnd_9x18_Makarov_M",8],[],""];

	_itemsU_base = [["ACE_fieldDressing",4],["ACE_tourniquet",1],["ACE_EarPlugs",1],["ACE_Flashlight_KSF1",1],["ACE_CableTie",1]];
	_itemsU_tl = _itemsU_base + [["ACRE_PRC148",1],["ACE_MapTools",1]];
	_itemsV_base = [["rhs_mag_rgd5",2,1],["rhs_mag_rdg2_white",2,1],["CUP_30Rnd_545x39_AK_M",7,30]];
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
		[_uniform,(_itemsU_tl + [["CUP_8Rnd_9x18_Makarov_M",1,8]])],
		[_vest_tl,_itemsV_base],
		[_backpack,[["ACRE_PRC117F",1],["SmokeShellPurple",2,1]]],
		_hat,
		"",
		["rhssaf_zrak_rd7j","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};


loadoutCC_TL = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_2,
		_weap_lat,
		_pistol,
		[_uniform,(_itemsU_tl + [["CUP_8Rnd_9x18_Makarov_M",1,8]])],
		[_vest_tl,_itemsV_base],
		[],
		_helmet,
		"",
		["rhssaf_zrak_rd7j","","","",[],[],""],
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
		[_vest_doc,_itemsV_base],
		[_backpack,_itemsB_medic],
		_helmet,
		"",
		["rhssaf_zrak_rd7j","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_AR = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["CUP_arifle_RPK74_45","","","",["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M",45],[],""],
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest_r,[["rhs_mag_rgd5",2,1],["rhs_mag_rdg2_white",2,1],["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M",4,45]]],
		[_backpack,[["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M",5,45]]],
		_helmet,
		"",
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
		[_vest_r,_itemsV_base],
		[_backpack,[["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M",5,45]]],
		_helmet,
		"",
		["rhssaf_zrak_rd7j","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};
loadoutCC_MG = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_pkm","","","",["rhs_100Rnd_762x54mmR_green",100],[],""],
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest_r,[["rhs_mag_rgd5",2,1],["rhs_mag_rdg2_white",2,1],["rhs_100Rnd_762x54mmR_green",1,100]]],
		[_backpack,[["rhs_100Rnd_762x54mmR_green",2,100]]],
		_helmet,
		"",
		[],
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
		[_vest_r,_itemsV_base],
		[_backpack,[["rhs_100Rnd_762x54mmR_green",2,100]]],
		_helmet,
		"",
		["rhssaf_zrak_rd7j","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_AT = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_2,
		_weap_at,
		[],
		[_uniform,_itemsU_base],
		[_vest_r,_itemsV_base],
		_mun_at,
		_helmet,
		"",
		[],
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
		[_vest_r,_itemsV_base],
		_mun_at,
		_helmet,
		"",
		["rhssaf_zrak_rd7j","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_DEMO = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_2,
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest_r,_itemsV_base],
		[_backpack,[["ACE_M26_Clacker",1],["ACE_DefusalKit",1],["ACE_EntrenchingTool",1],["SatchelCharge_Remote_Mag",1,1],["DemoCharge_Remote_Mag",1,1]]],
		_helmet,
		"",
		["rhssaf_zrak_rd7j","","","",[],[],""],
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
		[_uniform,(_itemsU_base + [["cup_optic_nspu",1]])],
		[_vest_m,[["rhs_mag_rgd5",2,1],["rhs_mag_rdg2_white",2,1],["CUP_10Rnd_762x54_SVD_M",9,10]]],
		[],
		_helmet,
		"",
		[],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_GL = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["CUP_arifle_AK74_GL_Early","","","",["CUP_30Rnd_545x39_AK_M",30],["CUP_1Rnd_HE_GP25_M",1],""],
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest_r,[["rhs_mag_rgd5",2,1],["rhs_mag_rdg2_white",2,1],["CUP_30Rnd_545x39_AK_M",5,30],["CUP_1Rnd_HE_GP25_M",9,1]]],
		[_backpack,[["CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M",4,30],["CUP_IlumFlareWhite_GP25_M",4,1],["CUP_1Rnd_SmokeRed_GP25_M",2,1],["ACE_HandFlare_Green",4,1],["rhs_mag_rgd5",2,1],["rhs_mag_rdg2_white",2,1]]],
		_helmet,
		"",
		[],
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
		[_vest_r,_itemsV_base],
		[_backpack,[["CUP_30Rnd_545x39_AK_M",3,30],["CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M",3,30],["rhs_mag_rdg2_white",2,1],["rhs_mag_rgd5",2,1],["ACE_HandFlare_Green",4,1]]],
		_helmet,
		"",
		["rhssaf_zrak_rd7j","","","",[],[],""],
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
		[_vest_r,_itemsV_base],
		[],
		_helmet,
		"",
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
		[_vest_r,_itemsV_base],
		[],
		_helmet,
		"",
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
		[_uniform,_itemsU_tl],
		[_vest,[["rhs_mag_rgd5",1,1],["rhs_mag_rdg2_white",1,1],["CUP_30Rnd_545x39_AK_M",5,30]]],
		[],
		"rhs_tsh4",
		"",
		["rhssaf_zrak_rd7j","","","",[],[],""],
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
		["rhs_uniform_df15_tan",_itemsU_tl],
		["rhs_vydra_3m",[["rhs_mag_rgd5",1,1],["rhs_mag_rdg2_white",1,1],["CUP_30Rnd_545x39_AK_M",5,30]]],
		[],
		"rhs_zsh7a_mike",
		"",
		[],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_SNIPER = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["CUP_srifle_SVD","cup_muzzle_snds_kzrzp_svd","","cup_optic_pso_1",["CUP_10Rnd_762x54_SVD_M",10],[],""],
		[],
		["CUP_hgun_PB6P9","cup_muzzle_pb6p9","","",["CUP_8Rnd_9x18_MakarovSD_M",8],[],""],
		[_uniform,_itemsU_tl],
		["rhs_vydra_3m",[["ACE_RangeCard",1],["rhs_mag_rdg2_white",2,1],["rhs_mag_rgd5",2,1],["CUP_10Rnd_762x54_SVD_M",5,10],["CUP_8Rnd_9x18_MakarovSD_M",5,8]]],
		[_backpack,[["CUP_10Rnd_762x54_SVD_M",5,10],["cup_optic_nspu",1]]],
		_hat,
		"rhs_scarf",
		["rhssaf_zrak_rd7j","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_OBS = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["CUP_srifle_VSSVintorez","",_lamp,"cup_optic_pso_1_1",["CUP_20Rnd_9x39_SP5_VSS_M",20],[],""],
		[],
		["CUP_hgun_PB6P9","cup_muzzle_pb6p9","","",["CUP_8Rnd_9x18_MakarovSD_M",8],[],""],
		[_uniform,_itemsU_tl],
		["rhs_vydra_3m",[["rhs_mag_rgd5",2,1],["rhs_mag_rdg2_white",2,1],["CUP_20Rnd_9x39_SP5_VSS_M",3,20],["rhs_mag_9x18_8_57N181S",3,8]]],
		[_backpack,[["CUP_20Rnd_9x39_SP5_VSS_M",6,20],["ACE_HandFlare_Green",4,1]]],
		_hat,
		"rhs_scarf",
		["rhssaf_zrak_rd7j","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_JTAC = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_2,
		[],
		_pistol,
		[_uniform,(_itemsU_tl + [["CUP_8Rnd_9x18_Makarov_M",1,8]])],
		[_vest_tl,[["rhs_mag_rgd5",2,1],["rhs_mag_rdg2_white",2,1],["CUP_30Rnd_545x39_AK_M",7,30]]],
		[_backpack,[["ACRE_PRC117F",1],["SmokeShellGreen",2,1]]],
		_helmet,
		"",
		["rhssaf_zrak_rd7j","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};