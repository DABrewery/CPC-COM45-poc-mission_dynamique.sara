
hard_setLoadout = 
{
	_unit = _this select 0;
	_loadout = _unit getVariable ["loadout","cc_r"];
	_uniform = "";
	_backpack = "";
	_helmet = "";
	_vest = "";
	_helmet = "";
	_hat = "";
	_hat2 = "";
	_nvg = "";
	_lamp = "";
	_weap_lat = [];
	_weap_at = [];
	_mun_at = [];

	switch (dax_p_nvg) do {
		case 0: {_nvg = ""; _lamp = "";};
		case 1: {_nvg = "CUP_NVG_PVS7"; _lamp = "cup_acc_flashlight";};
		case 2: {_nvg = ""; _lamp = "cup_acc_flashlight";};
		default {_nvg = ""; _lamp = "";};
	};
	
	switch (dax_loadoutcamo) do {
		case "winter": {
			_uniform = selectrandom ["CUP_U_B_BDUv2_Winter","CUP_U_B_BDUv2_gloves_Winter"];
			_backpack = "CUP_B_AlicePack_OD";
			_helmet = "CUP_H_PASGTv2_NVG_winter";
			_hat = "CUP_H_US_patrol_cap_winter";
			_hat2 = "CUP_H_FR_BeanieGreen";
			_vest = "CUP_V_B_PASGT_winter";
		};
		case "desert": {
			_uniform = selectrandom ["CUP_U_B_BDUv2_desert_US","CUP_U_B_BDUv2_desert_US","CUP_U_B_BDUv2_roll2_desert_US","CUP_U_B_BDUv2_roll_desert_US"];
			_backpack = "CUP_B_AlicePack_OD";
			_helmet = "CUP_H_PASGTv2_NVG_desert";
			_hat = "CUP_H_US_patrol_cap_desert";
			_hat2 = "H_Booniehat_tan";
			_vest = "CUP_V_B_PASGT";
		};
		case "jungle";
		case "woodland";
		case "polyvalent";
		default {
			_uniform = selectrandom ["CUP_U_B_BDUv2_M81_US","CUP_U_B_BDUv2_M81_US","CUP_U_B_BDUv2_roll2_M81_US","CUP_U_B_BDUv2_roll_M81_US"];
			_backpack = "CUP_B_AlicePack_OD";
			_helmet = "CUP_H_PASGTv2_NVG_OD";
			_hat = "CUP_H_US_patrol_cap_WDL";
			_hat2 = "CUP_H_FR_PRR_BoonieWDL";
			_vest = "CUP_V_B_PASGT_OD";
		};
	};
	switch (cc_rhsennemy) do {
		case false: {
			_weap_lat = ["CUP_launch_M72A6","","","",[],[],""];
			_weap_at = ["CUP_launch_MAAWS","","","cup_optic_maaws_scope",["CUP_MAAWS_HEAT_M",1],[],""];
			_mun_at = [["CUP_MAAWS_HEAT_M",2,1],["CUP_MAAWS_HEDP_M",1,1]];
		};
		case true;
		default {
			_weap_lat = ["rhs_weap_m72a7","","","",[],[],""];
			_weap_at = ["rhs_weap_maaws","","","rhs_optic_maaws",["rhs_mag_maaws_HEAT",1],[],""];
			_mun_at = [["rhs_mag_maaws_HEAT",2,1],["rhs_mag_maaws_HEDP",1,1]];
		};
	
	};
	_weap = ["CUP_arifle_M16A1","",_lamp,"",["CUP_30Rnd_556x45_Stanag",30],[],""];
	_pistol = ["CUP_hgun_Colt1911","","","",["CUP_7Rnd_45ACP_1911",7],[],""];

	_itemsU_base = [["ACE_fieldDressing",4],["ACE_tourniquet",1],["ACE_EarPlugs",1],["ACE_Flashlight_MX991",1],["ACRE_PRC343",1],["ACE_CableTie",1],["SmokeShell",1,1]];
	_itemsU_tl = _itemsU_base + [["ACRE_PRC148",1],["ACE_MapTools",1],["CUP_7Rnd_45ACP_1911",1,7]];
	_itemsV_base = [["rhs_mag_m67",2,1],["SmokeShell",1,1],["CUP_30Rnd_556x45_Stanag",7,30]];
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
		_weap,
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest,[["rhs_mag_m67",1,1],["SmokeShellGreen",3,1],["CUP_30Rnd_556x45_Stanag",7,30]]],
		[_backpack,[["ACRE_PRC117F",1],["SmokeShellPurple",2,1]]],
		_hat,
		"",
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};


loadoutCC_TL = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap,
		_weap_lat,
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest,[["rhs_mag_m67",2,1],["SmokeShellGreen",1,1],["CUP_30Rnd_556x45_Stanag",7,30]]],
		[],
		_helmet,
		"CUP_G_PMC_RadioHeadset",
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
		[_vest,_itemsV_base],
		[_backpack,_itemsB_medic],
		_helmet,
		"",
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_AR = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["CUP_lmg_M249_E2","","","",["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",200],[],""],
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_m67",2,1],["SmokeShell",1,1],["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",1,200]]],
		[_backpack,[["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",2,200]]],
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
		[_vest,_itemsV_base],
		[_backpack,[["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",4,200]]],
		_helmet,
		"",
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};
loadoutCC_MG = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["CUP_lmg_M60","","","",["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",100],[],""],
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_m67",2,1],["SmokeShell",1,1],["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",1,100]]],
		[_backpack,[["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",2,100]]],
		_helmet,
		"",
		["Binocular","","","",[],[],""],
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
		[_vest,_itemsV_base],
		[_backpack,[["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",4,100]]],
		_helmet,
		"",
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
		[_vest,_itemsV_base],
		[_backpack,_mun_at],
		_helmet,
		"",
		["Binocular","","","",[],[],""],
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
		[_vest,_itemsV_base],
		[_backpack,_mun_at],
		_helmet,
		"",
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
		[_vest,_itemsV_base],
		[_backpack,[["ACE_M26_Clacker",1],["ACE_DefusalKit",1],["ACE_EntrenchingTool",1],["SatchelCharge_Remote_Mag",1,1],["DemoCharge_Remote_Mag",2,1]]],
		_helmet,
		"",
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_M = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["CUP_srifle_M14_DMR","","","cup_optic_leupoldmk4",["CUP_20Rnd_762x51_DMR",20],[],""],
		[],
		_pistol,
		[_uniform,(_itemsU_base + [["ACE_RangeCard",1]])],
		[_vest,[["rhs_mag_m67",1,1],["SmokeShell",1,1],["CUP_20Rnd_762x51_DMR",6,20]]],
		[],
		_helmet,
		"",
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_GL = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["CUP_arifle_M16A1GL","","","",["CUP_30Rnd_556x45_Stanag",30],["CUP_1Rnd_HE_M203",1],""],
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_m67",2,1],["SmokeShell",1,1],["CUP_30Rnd_556x45_Stanag",5,30],["CUP_1Rnd_HE_M203",4,1]]],
		[_backpack,[["CUP_1Rnd_HE_M203",10,1],["CUP_1Rnd_SmokeRed_M203",6,1],["CUP_1Rnd_StarCluster_White_M203",6,1],["ACE_HandFlare_Green",2,1],["rhs_mag_m67",2,1],["SmokeShell",2,1],["CUP_30Rnd_556x45_Stanag",2,30]]],
		_helmet,
		"",
		["Binocular","","","",[],[],""],
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
		[_vest,_itemsV_base],
		[_backpack,[["CUP_30Rnd_556x45_Stanag",8,30],["SmokeShell",2,1],["rhs_mag_m67",2,1],["ACE_HandFlare_Green",2,1]]],
		_helmet,
		"",
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
		[_vest,_itemsV_base],
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
		[_vest,_itemsV_base],
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
		_weap,
		[],
		[],
		[_uniform,_itemsU_tl],
		[_vest,[["rhs_mag_m67",1,1],["SmokeShell",1,1],["CUP_30Rnd_556x45_Stanag",5,30]]],
		[],
		"CUP_H_USMC_Crew_Helmet",
		"",
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_PILOT = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap,
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest,[["rhs_mag_m67",1,1],["SmokeShell",1,1],["CUP_30Rnd_556x45_Stanag",5,30]]],
		[],
		"CUP_H_USMC_Helmet_Pilot",
		"",
		[],
		["ItemMap","","","ItemCompass","ItemWatch",(if (dax_p_nvg > 0) then {"CUP_NVG_PVS7"} else {""})]
	];
};

loadoutCC_SNIPER = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["CUP_srifle_M24_blk","","","cup_optic_leupoldmk4",["CUP_5Rnd_762x51_M24",5],[],"bipod_02_f_blk"],
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		["CUP_V_B_ALICE",[["ACE_Kestrel4500",1],["ACE_RangeCard",1],["SmokeShell",21,1],["rhs_mag_m67",2,1],["CUP_5Rnd_762x51_M24",4,5],["CUP_7Rnd_45ACP_1911",2,7]]],
		[_backpack,[["cup_optic_an_pvs_4",1],["CUP_5Rnd_762x51_M24",8,5]]],
		_hat2,
		"",
		["ACE_Vector","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",(if (dax_p_nvg > 0) then {"CUP_NVG_PVS7"} else {""})]
	];
};

loadoutCC_OBS = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["CUP_srifle_Mk12SPR","cup_muzzle_snds_mk12","cup_acc_flashlight","cup_optic_sb_11_4x20_pm",["CUP_20Rnd_556x45_Stanag",20],[],"bipod_02_f_blk"],
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		["CUP_V_B_ALICE",[["ACE_Kestrel4500",1],["ACE_RangeCard",1],["rhs_mag_m67",2,1],["SmokeShell",1,1],["CUP_20Rnd_556x45_Stanag",5,20],["CUP_7Rnd_45ACP_1911",2,7]]],
		[_backpack,[["CUP_20Rnd_556x45_Stanag_Tracer_Red",5,20],["cup_optic_compm2_low",1]]],
		_hat2,
		"",
		["ACE_Vector","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",(if (dax_p_nvg > 0) then {"CUP_NVG_PVS7"} else {""})]
	];
};

loadoutCC_JTAC = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap,
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest,[["rhs_mag_m67",2,1],["SmokeShell",1,1],["CUP_30Rnd_556x45_Stanag",7,30]]],
		[_backpack,[["ACRE_PRC117F",1],["SmokeShellGreen",4,1],["ACE_HandFlare_Green",1,1]]],
		_helmet,
		"CUP_G_PMC_RadioHeadset",
		["CUP_SOFLAM","","","",["Laserbatteries",1],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};
