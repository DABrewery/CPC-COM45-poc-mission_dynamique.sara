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
	_backpack_radio = "";
	_vest_r = "";
	_vest_doc = "";
	_vest_ar = "";
	_vest_m = "";
	_vest_gl = "";
	_vest_sl = "";
	_vest_tl = "";
	_vest_c = "";
	_helmet = "";
	_helmet_crew = "";
	_hat = "";
	_nvg = "";
	_lamp = "";
	_weap_lat = [];
	_weap_at = [];
	_mun_at = [];
	_facewear =  "";

	switch (dax_p_nvg) do {
		case 0: {_nvg = ""; _lamp = "";};
		case 1: {_nvg = "CUP_NVG_HMNVS"; _lamp = "cup_acc_llm";};
		case 2: {_nvg = ""; _lamp = "cup_acc_xm8_light_module";};
		default {_nvg = ""; _lamp = "";};
	};
	
	switch (dax_loadoutcamo) do {
		case "jungle";
		case "winter";
		case "woodland": {
			_uniform = selectrandom ["CUP_U_B_BAF_DPM_UBACSLONG","CUP_U_B_BAF_DPM_UBACSLONGKNEE","CUP_U_B_BAF_DPM_UBACSROLLED","CUP_U_B_BAF_DPM_UBACSROLLEDKNEE"];
			_backpack_big = "B_Carryall_oli";
			_backpack_med = "B_Kitbag_rgr";
			_backpack_radio = "CUP_B_Kombat_Radio_Olive";
			_helmet = selectRandom ["CUP_H_BAF_DPM_Mk6_EMPTY_PRR","CUP_H_BAF_DPM_Mk6_GLASS_PRR","CUP_H_BAF_DPM_Mk6_GOGGLES_PRR","CUP_H_BAF_DPM_Mk6_NETTING_PRR"];
			_helmet_crew = "CUP_H_BAF_DPM_Mk6_CREW_PRR";
			_hat = "H_Booniehat_oli";
			_vest_r = "CUP_V_B_BAF_DPM_Osprey_Mk3_Rifleman";
			_vest_doc = "CUP_V_B_BAF_DPM_Osprey_Mk3_Medic";
			_vest_ar = "CUP_V_B_BAF_DPM_Osprey_Mk3_AutomaticRifleman";
			_vest_m = "CUP_V_B_BAF_DPM_Osprey_Mk3_Scout";
			_vest_gl = "CUP_V_B_BAF_DPM_Osprey_Mk3_Grenadier";
			_vest_sl = "CUP_V_B_BAF_DPM_Osprey_Mk3_Officer";
			_vest_tl = "CUP_V_B_BAF_DPM_Osprey_Mk3_Officer";
			_vest_c = "CUP_V_B_BAF_DPM_Osprey_Mk3_Crewman";
		};
		case "desert": {
			_uniform = selectrandom ["CUP_U_B_BAF_DDPM_UBACSLONG","CUP_U_B_BAF_DDPM_UBACSLONGKNEE","CUP_U_B_BAF_DDPM_UBACSROLLED","CUP_U_B_BAF_DDPM_UBACSROLLEDKNEE"];
			_backpack_big = "B_Carryall_cbr";
			_backpack_med = "B_Kitbag_tan";
			_backpack_radio = "CUP_B_Motherlode_Radio_MTP";
			_helmet = selectRandom ["CUP_H_BAF_DDPM_Mk6_EMPTY_PRR","CUP_H_BAF_DDPM_Mk6_GLASS_PRR","CUP_H_BAF_DDPM_Mk6_GOGGLES_PRR","CUP_H_BAF_DDPM_Mk6_NETTING_PRR"];
			_helmet_crew = "CUP_H_BAF_DDPM_Mk6_CREW_PRR";
			_hat = "H_Booniehat_tan";
			_vest_r = "CUP_V_B_BAF_DDPM_Osprey_Mk3_Rifleman";
			_vest_doc = "CUP_V_B_BAF_DDPM_Osprey_Mk3_Medic";
			_vest_ar = "CUP_V_B_BAF_DDPM_Osprey_Mk3_AutomaticRifleman";
			_vest_m = "CUP_V_B_BAF_DDPM_Osprey_Mk3_Scout";
			_vest_gl = "CUP_V_B_BAF_DDPM_Osprey_Mk3_Grenadier";
			_vest_sl = "CUP_V_B_BAF_DDPM_Osprey_Mk3_Officer";
			_vest_tl = "CUP_V_B_BAF_DDPM_Osprey_Mk3_Officer";
			_vest_c = "CUP_V_B_BAF_DDPM_Osprey_Mk3_Crewman";
		};
		case "polyvalent";
		default {
			_uniform = selectrandom ["CUP_U_B_BAF_MTP_UBACSLONG","CUP_U_B_BAF_MTP_UBACSLONGKNEE","CUP_U_B_BAF_MTP_UBACSROLLED","CUP_U_B_BAF_MTP_UBACSROLLEDKNEE"];
			_backpack_big = "CUP_B_Predator_MTP";
			_backpack_med = "CUP_B_Motherlode_MTP";
			_backpack_radio = "CUP_B_Motherlode_Radio_MTP";
			_helmet = selectRandom ["CUP_H_BAF_MTP_Mk7_PRR","CUP_H_BAF_MTP_Mk7_PRR_SCRIM_B","CUP_H_BAF_MTP_Mk7_PRR_SCRIM_A"];
			_helmet_crew = "CUP_H_BAF_MTP_Mk6_CREW_PRR";
			_hat = "H_Booniehat_khk";
			_vest_r = "CUP_V_B_BAF_MTP_Osprey_Mk4_Rifleman";
			_vest_doc = "CUP_V_B_BAF_MTP_Osprey_Mk4_Medic";
			_vest_ar = "CUP_V_B_BAF_MTP_Osprey_Mk4_AutomaticRifleman";
			_vest_m = "CUP_V_B_BAF_MTP_Osprey_Mk4_Scout";
			_vest_gl = "CUP_V_B_BAF_MTP_Osprey_Mk4_Grenadier";
			_vest_sl = "CUP_V_B_BAF_MTP_Osprey_Mk4_Crewman";
			_vest_tl = "CUP_V_B_BAF_MTP_Osprey_Mk4_Officer";
			_vest_c = "CUP_V_B_BAF_MTP_Osprey_Mk4_Crewman";
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
		_facewear = selectrandom ["CUP_TK_NeckScarf","CUP_FR_NeckScarf","CUP_FR_NeckScarf2","G_Shades_Red","G_Shades_Green","G_Shades_Black"];
	} else {
		_facewear = selectRandomWeighted ["CUP_TK_NeckScarf",0.5,"CUP_FR_NeckScarf",0.5,"CUP_FR_NeckScarf2",0.5,"",0.9];
	};

	_weap_rco = ["CUP_arifle_L85A2_G","",_lamp,"cup_optic_elcan_reflex",["CUP_30Rnd_556x45_Stanag_L85",30],[],""];
	_pistol = ["CUP_hgun_Colt1911","","","",["CUP_7Rnd_45ACP_1911",7],[],""];

	_itemsU_base = [["ACE_fieldDressing",4],["ACE_tourniquet",1],["ACE_EarPlugs",1],["ACE_Flashlight_MX991",1],["ACRE_PRC343",1],["ACE_CableTie",1],["ACE_IR_Strobe_Item",1]];
	_itemsU_tl = _itemsU_base + [["ACRE_PRC148",1],["ACE_microDAGR",1],["ACE_MapTools",1]];
	_itemsV_base = [["CUP_HandGrenade_L109A1_HE",2,1],["SmokeShell",2,1],["CUP_30Rnd_556x45_Stanag_L85",7,30],["CUP_7Rnd_45ACP_1911",2,7]];
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
		_weap_rco,
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest_sl,[["CUP_HandGrenade_L109A1_HE",1,1],["SmokeShellGreen",4,1],["CUP_30Rnd_556x45_Stanag_L85",3,30],["CUP_30Rnd_556x45_Stanag_L85_Tracer_Red",4,30],["CUP_7Rnd_45ACP_1911",2,7]]],
		[_backpack_radio,[["ACRE_PRC117F",1],["SmokeShellPurple",2,1]]],
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
		_weap_rco,
		_weap_lat,
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest_tl,[["CUP_HandGrenade_L109A1_HE",2,1],["SmokeShell",1,1],["SmokeShellGreen",3,1],["CUP_30Rnd_556x45_Stanag_L85",3,30],["CUP_30Rnd_556x45_Stanag_L85_Tracer_Red",4,30],["CUP_7Rnd_45ACP_1911",2,7]]],
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
		_weap_rco,
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
		["CUP_lmg_m249_para","","","",["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1",200],[],""],
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_ar,[["CUP_HandGrenade_L109A1_HE",1,1],["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1",2,200],["CUP_7Rnd_45ACP_1911",2,7]]],
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
		_weap_rco,
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_r,_itemsV_base],
		[_backpack_med,[["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1",4,200]]],
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
		["CUP_lmg_L7A2","","","cup_optic_elcanm145",["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",100],[],""],
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_ar,[["CUP_HandGrenade_L109A1_HE",1,1],["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",2,100],["CUP_7Rnd_45ACP_1911",2,7]]],
		[],
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
		[_backpack_med,[["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",4,100]]],
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
		_weap_rco,
		_weap_at,
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
		_weap_rco,
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
		["CUP_srifle_L129A1_HG","",_lamp,"cup_optic_sb_11_4x20_pm",["CUP_20Rnd_762x51_L129_M",20],[],"bipod_01_f_blk"],
		[],
		_pistol,
		[_uniform,(_itemsU_base + [["cup_optic_elcan_reflex",1],["ACE_Kestrel4500",1],["ACE_RangeCard",1]])],
		[_vest_m,[["CUP_HandGrenade_L109A1_HE",2,1],["SmokeShell",1,1],["CUP_20Rnd_762x51_L129_M",9,20],["CUP_7Rnd_45ACP_1911",2,7]]],
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
		["CUP_arifle_L85A2_GL","",_lamp,"cup_optic_elcan_reflex",["CUP_30Rnd_556x45_Stanag_L85",30],["CUP_1Rnd_HEDP_M203",1],""],
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_gl,[["CUP_HandGrenade_L109A1_HE",2,1],["SmokeShell",2,1],["CUP_30Rnd_556x45_Stanag_L85",7,30],["CUP_1Rnd_HEDP_M203",4,1],["CUP_7Rnd_45ACP_1911",2,7]]],
		[_backpack_med,[["CUP_1Rnd_HEDP_M203",10,1],["CUP_1Rnd_SmokeRed_M203",6,1],["CUP_1Rnd_StarCluster_White_M203",6,1],["ACE_HandFlare_Green",2,1],["CUP_HandGrenade_L109A1_HE",2,1],["SmokeShell",2,1]]],
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
		[_backpack_med,[["CUP_30Rnd_556x45_Stanag_L85",8,30],["SmokeShell",2,1],["CUP_HandGrenade_L109A1_HE",2,1],["ACE_HandFlare_Green",2,1]]],
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
		_weap_rco,
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
		_weap_rco,
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest_c,[["CUP_HandGrenade_L109A1_HE",2,1],["SmokeShell",1,1],["CUP_30Rnd_556x45_Stanag_L85",5,30],["CUP_7Rnd_45ACP_1911",2,7]]],
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
		_weap_rco,
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest_c,[["CUP_HandGrenade_L109A1_HE",2,1],["SmokeShell",1,1],["CUP_30Rnd_556x45_Stanag_L85",5,30],["CUP_7Rnd_45ACP_1911",2,7]]],
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
		[(if (dax_loadoutcamo == "desert") then {"CUP_srifle_AWM_des"} else {"CUP_srifle_AWM_wdl"}),"","","cup_optic_leupold_vx3",["CUP_5Rnd_86x70_L115A1",5],[],"bipod_01_f_blk"],
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest_m,[["ACE_Kestrel4500",1],["ACE_RangeCard",1],["ACE_ATragMX",1],["SmokeShell",2,1],["CUP_HandGrenade_L109A1_HE",2,1],["CUP_5Rnd_86x70_L115A1",11,5],["cup_optic_an_pvs_4",1],["CUP_7Rnd_45ACP_1911",4,7]]],
		[],
		_hat,
		_facewear,
		["Rangefinder","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",(if (dax_p_nvg > 0) then {"CUP_NVG_PVS15_black"} else {""})]
	];
};

loadoutCC_OBS = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["CUP_arifle_L85A2_G","cup_muzzle_snds_l85","cup_acc_llm","cup_optic_elcan_reflex",["CUP_30Rnd_556x45_Stanag_L85",30],[],""],
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest_sl,[["ACE_Kestrel4500",1],["ACE_ATragMX",1],["CUP_HandGrenade_L109A1_HE",2,1],["SmokeShell",1,1],["CUP_30Rnd_556x45_Stanag_L85",7,30],["CUP_7Rnd_45ACP_1911",2,7]]],
		[],
		_hat,
		_facewear,
		["Rangefinder","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",(if (dax_p_nvg > 0) then {"CUP_NVG_PVS15_black"} else {""})]
	];
};

loadoutCC_JTAC = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_rco,
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest_sl,[["CUP_HandGrenade_L109A1_HE",2,1],["SmokeShell",2,1],["CUP_30Rnd_556x45_Stanag_L85",7,30],["CUP_7Rnd_45ACP_1911",2,7]]],
		[_backpack_radio,[["ACRE_PRC117F",1],["SmokeShellGreen",4,1],["ACE_HandFlare_Green",1,1]]],
		_helmet,
		_facewear,
		["Laserdesignator_01_khk_F","","","",["Laserbatteries",1],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};