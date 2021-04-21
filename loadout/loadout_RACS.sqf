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
	_vest_2 = "";
	_vest_1 = "";
	_helmet = "";
	_helmet_tl = "";
	_hat = "";
	_nvg = "";
	_lamp = "";
	_weap_lat = [];
	_weap_at = [];
	_mun_at = [];
	_facewear =  "";

	switch (dax_p_nvg) do {
		case 0: {_nvg = ""; _lamp = "";};
		case 1: {_nvg = "CUP_NVG_PVS7"; _lamp = "cup_acc_flashlight";};
		case 2: {_nvg = ""; _lamp = "cup_acc_flashlight";};
		default {_nvg = ""; _lamp = "";};
	};
	
	switch (dax_loadoutcamo) do {
		case "winter": {
			_uniform = "CUP_U_I_RACS_Urban_1";
			_backpack_big = "B_MU_Carryall_blk";
			_backpack_med = "B_FieldPack_blk";
			_helmet = "CUP_H_PASGTv2_NVG_Urban";
			_helmet_tl = "CUP_H_PASGTv2_NVG_Urban";
			_vest_1 = "CUP_V_B_Interceptor_Rifleman_Grey";
			_vest_2 = "CUP_V_B_Interceptor_Grenadier_Grey";
			_hat = "H_Bandanna_gry";
		};
		case "jungle": {
			_uniform = selectrandom ["CUP_U_I_RACS_mech_1","CUP_U_I_RACS_mech_2"];
			_backpack_big = "B_Carryall_oli";
			_backpack_med = "CUP_B_AlicePack_OD";
			_helmet = "CUP_H_PASGTv2_NVG_tigerstripe";
			_helmet_tl = "CUP_H_PASGTv2_NVG_tigerstripe";
			_vest_1 = "CUP_V_B_Interceptor_Rifleman_Olive";
			_vest_2 = "CUP_V_B_Interceptor_Grenadier_Olive";
			_hat = "H_Bandanna_khk";
		};
		case "desert": {
			_uniform = selectrandom ["CUP_U_I_RACS_Desert_1","CUP_U_I_RACS_Desert_2"];
			_backpack_big = "B_Carryall_cbr";
			_backpack_med = "B_FieldPack_cbr";
			_helmet = "CUP_H_PASGTv2_NVG_desert";
			_helmet_tl = "CUP_H_PASGTv2_NVG_desert";
			_vest_1 = "CUP_V_B_Interceptor_Rifleman_Coyote";
			_vest_2 = "CUP_V_B_Interceptor_Grenadier_Coyote";
			_hat = "H_Bandanna_sand";
		};
		case "woodland";
		case "polyvalent";
		default {
			_uniform = selectrandom ["CUP_U_I_RACS_WDL_1","CUP_U_I_RACS_WDL_2"];
			_backpack_big = "B_Carryall_oli";
			_backpack_med = "CUP_B_AlicePack_OD";
			_helmet = "CUP_H_PASGTv2_NVG_ERDL_lowland";
			_helmet_tl = "CUP_H_PASGTv2_NVG_ERDL_lowland";
			_vest_1 = "CUP_V_B_Interceptor_Rifleman_Olive";
			_vest_2 = "CUP_V_B_Interceptor_Grenadier_Olive";
			_hat = "H_Bandanna_khk";
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
		_facewear = selectRandomWeighted ["G_Shades_Red",0.5,"G_Shades_Green",0.5,"G_Shades_Black",0.5,"CUP_FR_NeckScarf",0.5,"CUP_TK_NeckScarf",0.5,"",0.9];
	} else {
		_facewear = selectRandomWeighted ["CUP_FR_NeckScarf",0.5,"CUP_TK_NeckScarf",0.5,"",0.9];
	};

	_weap_1 = ["CUP_arifle_M16A2","",_lamp,"",["CUP_30Rnd_556x45_Stanag",30],[],""];
	_weap_2 = ["CUP_arifle_Colt727","",_lamp,"",["CUP_30Rnd_556x45_Stanag",30],[],""];
	_pistol = ["CUP_hgun_Colt1911","","","",["CUP_7Rnd_45ACP_1911",7],[],""];

	_itemsU_base = [["ACE_fieldDressing",4],["ACE_tourniquet",1],["ACE_EarPlugs",1],["ACE_Flashlight_MX991",1],["ACRE_PRC343",1],["ACE_CableTie",1]];
	_itemsU_tl = _itemsU_base + [["ACRE_PRC148",1],["ACE_DAGR",1],["ACE_MapTools",1],["ACE_IR_Strobe_Item",1]];
	_itemsV_base = [["CUP_HandGrenade_M67",2,1],["SmokeShell",2,1],["CUP_30Rnd_556x45_Stanag",7,30]];
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
		[_vest_1,[["CUP_HandGrenade_M67",1,1],["SmokeShellGreen",4,1],["CUP_30Rnd_556x45_Stanag",5,30],["CUP_7Rnd_45ACP_1911",2,7]]],
		[_backpack_med,[["ACRE_PRC117F",1],["SmokeShellPurple",2,1]]],
		"CUP_H_RACS_Beret_Blue",
		_facewear,
		["ACE_Vector","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};


loadoutCC_TL = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_2,
		_weap_lat,
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest_1,[["CUP_HandGrenade_M67",1,1],["SmokeShellGreen",4,1],["CUP_30Rnd_556x45_Stanag",5,30],["CUP_7Rnd_45ACP_1911",2,7]]],
		[],
		_helmet_tl,
		_facewear,
		["ACE_Vector","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};

loadoutCC_DOC = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_1,
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest_2,_itemsV_base],
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
		["CUP_lmg_minimi","","","",["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",200],[],""],
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest_2,[["CUP_HandGrenade_M67",2,1],["SmokeShell",2,1],["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",1,200]]],
		[_backpack_med,[["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",2,200]]],
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
		[],
		[_uniform,_itemsU_base],
		[_vest_2,_itemsV_base],
		[_backpack_med,[["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",2,200]]],
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
		["CUP_lmg_M240","","","",["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",100],[],""],
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest_2,[["CUP_HandGrenade_M67",2,1],["SmokeShell",2,1],["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",1,100]]],
		[_backpack_med,[["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",2,100]]],
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
		[],
		[_uniform,_itemsU_base],
		[_vest_2,_itemsV_base],
		[_backpack_med,[["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",3,100]]],
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
		_weap_1,
		_weap_at,
		[],
		[_uniform,_itemsU_base],
		[_vest_2,_itemsV_base],
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
		[],
		[_uniform,_itemsU_base],
		[_vest_2,_itemsV_base],
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
		_weap_1,
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest_2,_itemsV_base],
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
		["CUP_srifle_Mk12SPR","",_lamp,"cup_optic_sb_11_4x20_pm",["CUP_20Rnd_556x45_Stanag",20],[],"bipod_01_f_blk"],
		[],
		_pistol,
		[_uniform,(_itemsU_base + [["cup_optic_rco",1],["ACE_Kestrel4500",1],["ACE_RangeCard",1]])],
		[_vest_2,[["CUP_HandGrenade_M67",2,1],["SmokeShell",1,1],["CUP_20Rnd_556x45_Stanag",9,20],["CUP_7Rnd_45ACP_1911",2,7]]],
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
		["CUP_arifle_M16A2_GL","",_lamp,"",["CUP_30Rnd_556x45_Stanag",30],["CUP_1Rnd_HEDP_M203",1],""],
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest_2,[["CUP_HandGrenade_M67",2,1],["SmokeShell",2,1],["CUP_30Rnd_556x45_Stanag",7,30],["CUP_1Rnd_HEDP_M203",4,1]]],
		[_backpack_med,[["CUP_1Rnd_HEDP_M203",10,1],["CUP_1Rnd_SmokeRed_M203",6,1],["CUP_1Rnd_StarCluster_White_M203",6,1],["ACE_HandFlare_Green",2,1],["CUP_HandGrenade_M67",2,1],["SmokeShell",2,1]]],
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
		[],
		[_uniform,_itemsU_base],
		[_vest_2,_itemsV_base],
		[_backpack_med,[["CUP_30Rnd_556x45_Stanag",8,30],["SmokeShell",2,1],["CUP_HandGrenade_M67",2,1],["ACE_HandFlare_Green",2,1]]],
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
		_weap_1,
		_weap_lat,
		[],
		[_uniform,_itemsU_base],
		[_vest_2,_itemsV_base],
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
		[],
		[_uniform,_itemsU_base],
		[_vest_2,_itemsV_base],
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
		[],
		[_uniform,_itemsU_tl],
		[_vest_1,[["CUP_HandGrenade_M67",2,1],["SmokeShell",2,1],["CUP_30Rnd_556x45_Stanag",5,30]]],
		[],
		"CUP_H_USMC_Crew_Helmet",
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
		[_vest_1,[["CUP_HandGrenade_M67",1,1],["SmokeShell",1,1],["CUP_30Rnd_556x45_Stanag",5,30],["CUP_7Rnd_45ACP_1911",2,7]]],
		[],
		"CUP_H_USMC_Helmet_Pilot",
		"",
		[],
		["ItemMap","","","ItemCompass","ACE_Altimeter",(if (dax_p_nvg > 0) then {"CUP_NVG_PVS7"} else {""})]
	];
};

loadoutCC_SNIPER = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		[(if (dax_loadoutcamo == "desert") then {"CUP_srifle_M24_des"} else {"CUP_srifle_M24_blk"}),"","","cup_optic_leupoldmk4",["CUP_5Rnd_762x51_M24",5],[],"bipod_01_f_blk"],
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest_2,[["ACE_Kestrel4500",1],["ACE_RangeCard",1],["ACE_ATragMX",1],["SmokeShell",1,1],["CUP_HandGrenade_M67",1,1],["CUP_5Rnd_762x51_M24",8,5],["cup_optic_an_pvs_4",1],["CUP_7Rnd_45ACP_1911",2,7]]],
		[],
		_hat,
		_facewear,
		["ACE_Vector","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",(if (dax_p_nvg > 0) then {"CUP_NVG_PVS7"} else {""})]
	];
};

loadoutCC_OBS = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["CUP_arifle_Colt727","cup_muzzle_snds_m16","cup_acc_llm","cup_optic_compm2_low",["CUP_30Rnd_556x45_Stanag",30],[],""],
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest_2,[["ACE_Kestrel4500",1],["ACE_ATragMX",1],["CUP_HandGrenade_M67",2,1],["SmokeShell",2,1],["CUP_30Rnd_556x45_Stanag",7,30],["CUP_7Rnd_45ACP_1911",2,7]]],
		[],
		_hat,
		_facewear,
		["ACE_Vector","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",(if (dax_p_nvg > 0) then {"CUP_NVG_PVS7"} else {""})]
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
		[_vest_1,[["CUP_HandGrenade_M67",1,1],["SmokeShellGreen",4,1],["CUP_30Rnd_556x45_Stanag",5,30],["CUP_7Rnd_45ACP_1911",2,7]]],
		[_backpack_med,[["ACRE_PRC117F",1],["SmokeShellGreen",4,1],["ACE_HandFlare_Green",1,1]]],
		_helmet_tl,
		_facewear,
		["CUP_SOFLAM","","","",["Laserbatteries",1],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};