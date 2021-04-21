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
	_uniform = [];
	_backpack_big = [];
	_backpack_small = [];
	_headgear = [];
	_facewear = [];
	_nvg = "";
	_lamp = "";
	_weap_lat = [];
	_weap_at = [];
	_mun_at = [];
	
	switch (dax_loadoutcamo) do {
		case "winter": {
			_uniform = ["rhsgref_uniform_reed"];
			_backpack_big = ["rhssaf_kitbag_md2camo","rhssaf_alice_smb","rhssaf_alice_md2camo","rhsgref_hidf_alicepack","B_Kitbag_sgg","B_Kitbag_rgr","B_Carryall_oli","B_Carryall_khk","B_Carryall_cbr"];
			_backpack_small = ["B_FieldPack_cbr","B_FieldPack_khk","B_FieldPack_oli","B_TacticalPack_blk","B_TacticalPack_rgr"];
			_headgear = ["H_Bandanna_gry","H_Bandanna_khk","H_Bandanna_sgg","H_Bandanna_camo","H_Booniehat_khk","H_Booniehat_oli","H_Cap_blk","H_Cap_grn","H_Cap_oli","rhs_Booniehat_m81","rhs_beanie_green","rhs_fieldcap_vsr","rhssaf_bandana_digital","rhssaf_bandana_md2camo","rhssaf_bandana_oakleaf","rhssaf_bandana_smb","rhs_beanie_green","rhs_beanie_green","rhs_beanie_green","rhs_beanie_green","rhs_beanie_green"];
			_facewear = ["CUP_FR_NeckScarf2","CUP_FR_NeckScarf","CUP_TK_NeckScarf","rhs_scarf","rhsusf_shemagh2_od","rhsusf_shemagh_od","G_Shades_Red","G_Shades_Green","G_Shades_Black","G_Bandanna_oli","G_Bandanna_khk"];
		};
		case "woodland": {
			_uniform = ["rhsgref_uniform_dpm","rhsgref_uniform_dpm_olive","rhsgref_uniform_flecktarn","rhsgref_uniform_reed","rhsgref_uniform_woodland","rhsgref_uniform_woodland_olive","rhssaf_uniform_m93_oakleaf","rhssaf_uniform_m93_oakleaf_summer"];
			_backpack_big = ["rhssaf_kitbag_md2camo","rhssaf_alice_smb","rhssaf_alice_md2camo","rhsgref_hidf_alicepack","B_Kitbag_mcamo","B_Kitbag_rgr","B_Carryall_oli","B_Carryall_khk","B_Carryall_cbr"];
			_backpack_small = ["B_FieldPack_cbr","B_FieldPack_khk","B_FieldPack_oli","B_TacticalPack_blk","B_TacticalPack_rgr","B_TacticalPack_oli","B_MU_TacticalPack_cbr"];
			_headgear = ["H_Bandanna_gry","H_Bandanna_khk","H_Bandanna_sgg","H_Bandanna_camo","H_Booniehat_khk","H_Booniehat_oli","H_Cap_blk","H_Cap_grn","H_Cap_oli","rhs_Booniehat_m81","rhs_beanie_green","rhs_fieldcap_vsr","rhssaf_bandana_digital","rhssaf_bandana_md2camo","rhssaf_bandana_oakleaf","rhssaf_bandana_smb","rhssaf_booniehat_md2camo"];
			_facewear = ["CUP_FR_NeckScarf2","CUP_FR_NeckScarf","CUP_TK_NeckScarf","rhs_scarf","rhsusf_shemagh2_od","rhsusf_shemagh_od","G_Shades_Red","G_Shades_Green","G_Shades_Black","G_Bandanna_oli","G_Bandanna_khk"];
		};
		case "desert": {
			_uniform = ["CPC_ME_Uniform_M93_sand_1","CPC_ME_Uniform_M93_sand_2","CPC_ME_Uniform_M93_sand_3","CPC_ME_Uniform_M93_sand_4"];
			_backpack_big = ["rhssaf_kitbag_md2camo","rhssaf_alice_smb","rhssaf_alice_md2camo","rhsgref_hidf_alicepack","B_Kitbag_mcamo","B_Kitbag_rgr","B_Kitbag_cbr","B_Carryall_oli","B_Carryall_khk","B_Carryall_cbr"];
			_backpack_small = ["B_FieldPack_cbr","B_FieldPack_khk","B_FieldPack_oli","B_TacticalPack_blk","B_TacticalPack_rgr","B_TacticalPack_oli","B_MU_TacticalPack_cbr"];
			_headgear = ["H_Shemag_olive","H_ShemagOpen_tan","H_ShemagOpen_tan","H_ShemagOpen_khk","H_ShemagOpen_khk","H_Cap_tan","H_Cap_grn","H_Cap_oli","H_Bandanna_sand","H_Booniehat_tan"];
			_facewear = ["CUP_FR_NeckScarf2","CUP_FR_NeckScarf","CUP_TK_NeckScarf","G_Shades_Red","G_Shades_Green","G_Shades_Blue","G_Shades_Black"];
		};
		case "jungle": {
			_uniform = ["rhsgref_uniform_olive"];
			_backpack_big = ["B_Carryall_khk","B_Carryall_oli","B_Kitbag_rgr","rhsgref_hidf_alicepack"];
			_backpack_small = ["B_FieldPack_khk","B_FieldPack_oli","B_TacticalPack_oli","B_TacticalPack_blk"];
			_headgear = ["CPC_JUN_fieldcap","CPC_JUN_fieldcap","CPC_JUN_fieldcap","CPC_JUN_fieldcap","H_Cap_oli","CPC_JUN_fieldcap","H_Cap_blk","CPC_JUN_fieldcap","H_Booniehat_oli","H_Booniehat_khk","rhssaf_bandana_md2camo","CPC_JUN_fieldcap","H_Bandanna_sgg","H_Bandanna_khk","H_Bandanna_cbr","H_Bandanna_gry"];
			_facewear = ["CUP_FR_NeckScarf2","CUP_FR_NeckScarf","CUP_TK_NeckScarf","G_Shades_Red","G_Shades_Green","G_Shades_Blue","G_Shades_Black"];
		};
		case "polyvalent";
		default {
			_uniform = ["U_BG_Guerrilla_6_1","U_BG_Guerilla1_1","U_BG_Guerilla2_2","U_BG_Guerilla2_1","U_BG_Guerilla2_3","U_BG_leader","U_I_C_Soldier_Bandit_2_F","U_I_C_Soldier_Bandit_3_F","U_MU_B_GuerillaGarment_brown","U_MU_B_GuerillaGarment_skull","U_MU_B_GuerillaGarment2_brown","U_MU_B_GuerillaGarment2_grey"];
			_backpack_big = ["rhssaf_kitbag_md2camo","rhssaf_alice_smb","rhssaf_alice_md2camo","rhsgref_hidf_alicepack","B_Kitbag_mcamo","B_Kitbag_rgr","B_Kitbag_cbr","B_Carryall_oli","B_Carryall_khk","B_Carryall_cbr"];
			_backpack_small = ["B_FieldPack_cbr","B_FieldPack_khk","B_FieldPack_oli","B_TacticalPack_blk","B_TacticalPack_rgr","B_TacticalPack_oli","B_MU_TacticalPack_cbr"];
			_headgear = ["H_Booniehat_dgtl","H_Cap_red","H_Cap_tan","rhssaf_booniehat_digital","rhssaf_bandana_oakleaf","rhssaf_bandana_md2camo","rhssaf_bandana_digital","H_Cap_oli","H_Cap_grn","H_Cap_blk","H_Booniehat_tan","H_Booniehat_oli","H_Booniehat_khk","H_Bandanna_camo","H_Bandanna_sand","H_Bandanna_sgg","H_Bandanna_khk","H_Bandanna_cbr","H_Bandanna_gry"];
			_facewear = ["rhs_scarf","rhsusf_oakley_goggles_clr","rhsusf_shemagh2_tan","rhsusf_shemagh2_od","G_Bandanna_tan","G_Bandanna_oli","G_Bandanna_khk","G_Bandanna_blk","G_Aviator","CUP_FR_NeckScarf2","CUP_FR_NeckScarf","CUP_TK_NeckScarf","G_Shades_Red","G_Shades_Green","G_Shades_Blue","G_Shades_Black"];
		};
	};
	switch (dax_p_nvg) do {
		case 0: {_nvg = ""; _lamp = "";};
		case 1: {_nvg = "CUP_NVG_HMNVS"; _lamp = "rhs_acc_2dpzenit";};
		case 2: {_nvg = ""; _lamp = "rhs_acc_2dpzenit";};
		default {_nvg = ""; _lamp = "";};
	};
	switch (cc_rhsennemy) do {
		case true: {
			_weap_lat = ["rhs_weap_rpg75","","","",[],[],""];
			_weap_at = ["rhs_weap_rpg7","","","rhs_acc_pgo7v3",["rhs_rpg7_PG7V_mag",1],[],""];
			_mun_at = ["rhs_rpg_empty",[["rhs_rpg7_PG7V_mag",4,1]]];
		};
		case false: {
			_weap_lat = ["CUP_launch_RPG18","","","",[],[],""];
			_weap_at = ["CUP_launch_RPG7V","","","cup_optic_pgo7v3",["CUP_PG7V_M",1],[],""];
			_mun_at = ["rhs_rpg_empty",[["CUP_PG7V_M",2,1]]];
		};
		default {
			_weap_lat = ["rhs_weap_rpg75","","","",[],[],""];
			_weap_at = ["rhs_weap_rpg7","","","rhs_acc_pgo7v3",["rhs_rpg7_PG7V_mag",1],[],""];
			_mun_at = ["rhs_rpg_empty",[["rhs_rpg7_PG7V_mag",4,1]]];
		};
	
	};
	
	_uniform = selectrandom _uniform;
	_backpack_big = selectrandom _backpack_big;
	_backpack_small = selectrandom _backpack_small;
	_headgear = selectrandom _headgear;
	_facewear = selectrandom _facewear;
	_vest = selectrandom ["V_TacChestrig_cbr_F","V_TacChestrig_grn_F","V_TacChestrig_oli_F","rhsgref_chestrig","rhssaf_vest_md99_md2camo_rifleman","rhssaf_vest_md99_woodland_rifleman","rhssaf_vest_md99_digital_rifleman"];
	_vestRadio = selectrandom ["rhssaf_vest_md99_woodland_rifleman_radio","rhssaf_vest_md99_md2camo_rifleman_radio","rhssaf_vest_md99_digital_rifleman_radio"];
	_itemsU_base = [["ACE_fieldDressing",4],["ACE_tourniquet",1],["ACE_EarPlugs",1],["ACE_Flashlight_XL50",1],["SmokeShell",2,1]];
	_itemsU_tl = [["ACRE_PRC148",1],["ACE_MapTools",1]];
	_itemsB_medic = [["ACE_personalAidKit",1],["ACE_surgicalKit",1],["ACE_salineIV",2],["ACE_salineIV_250",2],["ACE_salineIV_500",2],["ACE_packingBandage",15],["ACE_fieldDressing",15],["ACE_elasticBandage",10],["ACE_quikclot",10],["ACE_morphine",8],["ACE_epinephrine",4],["ACE_tourniquet",4]];
	_weap = selectrandom ["rhs_weap_pm63","rhs_weap_akms","rhs_weap_akm"];
	_mag = selectrandom ["rhssaf_30Rnd_762x39mm_M67","rhs_30Rnd_762x39mm","rhs_30Rnd_762x39mm","rhs_30Rnd_762x39mm_bakelite"];
	_weap_r = [_weap,"",_lamp,"",[_mag,30],[],"rhs_acc_dtkakm"];
	
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
		_weap_r,
		[],
		[],
		[_uniform,(_itemsU_base + _itemsU_tl)],
		[_vestRadio,[["rhs_mag_rgd5",2,1],[_mag,5,30],["SmokeShellGreen",1,1]]],
		[_backpack_small,[["ACRE_PRC117F",1],["SmokeShellPurple",2,1]]],
		_headgear,
		(if ((random 100 < 50) && (dax_p_nvg < 1)) then {_facewear} else {""}),
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_TL = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r,
		_weap_lat,
		[],
		[_uniform,(_itemsU_base + _itemsU_tl)],
		[_vestRadio,[["rhs_mag_rgd5",2,1],[_mag,5,30],["SmokeShellGreen",1,1]]],
		[],
		_headgear,
		(if ((random 100 < 50) && (dax_p_nvg < 1)) then {_facewear} else {""}),
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_DOC = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r,
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_rgd5",2,1],[_mag,5,30]]],
		[_backpack_big,_itemsB_medic],
		_headgear,
		(if ((random 100 < 50) && (dax_p_nvg < 1)) then {_facewear} else {""}),
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_AR = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_akms","",_lamp,"",["rhs_75Rnd_762x39mm",75],[],"rhs_acc_dtkakm"],
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_rgd5",2,1],["rhs_75Rnd_762x39mm",2,75]]],
		[_backpack_small,[["rhs_75Rnd_762x39mm",5,75]]],
		_headgear,
		(if ((random 100 < 50) && (dax_p_nvg < 1)) then {_facewear} else {""}),
		[],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_AAR = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r,
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_rgd5",2,1],[_mag,5,30]]],
		[_backpack_big,[["rhs_75Rnd_762x39mm",8,75]]],
		_headgear,
		(if ((random 100 < 50) && (dax_p_nvg < 1)) then {_facewear} else {""}),
		["Binocular","","","",[],[],""],
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
		[_vest,[["rhs_mag_rgd5",2,1],["rhs_100Rnd_762x54mmR_green",1,100]]],
		[_backpack_small,[["rhs_100Rnd_762x54mmR_green",3,100]]],
		_headgear,
		(if ((random 100 < 50) && (dax_p_nvg < 1)) then {_facewear} else {""}),
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_AMG = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r,
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_rgd5",2,1],[_mag,5,30]]],
		[_backpack_big,[["rhs_100Rnd_762x54mmR_green",4,100]]],
		_headgear,
		(if ((random 100 < 50) && (dax_p_nvg < 1)) then {_facewear} else {""}),
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_AT = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r,
		_weap_at,
		[],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_rgd5",2,1],[_mag,5,30]]],
		_mun_at,
		_headgear,
		(if ((random 100 < 50) && (dax_p_nvg < 1)) then {_facewear} else {""}),
		[],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_AAT = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r,
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_rgd5",2,1],[_mag,5,30]]],
		_mun_at,
		_headgear,
		(if ((random 100 < 50) && (dax_p_nvg < 1)) then {_facewear} else {""}),
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_DEMO = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r,
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_rgd5",2,1],[_mag,5,30]]],
		[_backpack_big,[["ACE_M26_Clacker",1],["ACE_DefusalKit",1],["ACE_EntrenchingTool",1],["SatchelCharge_Remote_Mag",2,1],["DemoCharge_Remote_Mag",2,1]]],
		_headgear,
		(if ((random 100 < 50) && (dax_p_nvg < 1)) then {_facewear} else {""}),
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_M = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_m76","",_lamp,"rhs_acc_pso1m2",["rhsgref_10Rnd_792x57_m76",10],[],""],
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_rgd5",2,1],["rhsgref_10Rnd_792x57_m76",9,10]]],
		[],
		_headgear,
		(if ((random 100 < 50) && (dax_p_nvg < 1)) then {_facewear} else {""}),
		["ACE_Vector","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_GL = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_akm_gp25","","","",[_mag,30],["rhs_VOG25",1],"rhs_acc_dtkakm"],
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_rgd5",2,1],[_mag,5,30]]],
		[_backpack_small,[["rhs_VOG25",9,1],["rhs_GRD40_Red",6,1],["rhs_VG40OP_white",6,1],["ACE_HandFlare_Green",2,1],["rhs_mag_rgd5",2,1],["SmokeShell",2,1]]],
		_headgear,
		(if ((random 100 < 50) && (dax_p_nvg < 1)) then {_facewear} else {""}),
		[],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_A = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r,
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_rgd5",2,1],[_mag,5,30]]],
		[_backpack_big,[[_mag,8,30],["SmokeShell",2,1],["rhs_mag_rgd5",2,1],["ACE_HandFlare_Green",2,1]]],
		_headgear,
		(if ((random 100 < 50) && (dax_p_nvg < 1)) then {_facewear} else {""}),
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_LAT = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r,
		_weap_lat,
		[],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_rgd5",2,1],[_mag,5,30]]],
		[],
		_headgear,
		(if ((random 100 < 50) && (dax_p_nvg < 1)) then {_facewear} else {""}),
		[],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_R = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r,
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_rgd5",2,1],[_mag,5,30]]],
		[],
		_headgear,
		(if ((random 100 < 50) && (dax_p_nvg < 1)) then {_facewear} else {""}),
		[],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_CREW = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r,
		[],
		[],
		[_uniform,(_itemsU_base + _itemsU_tl)],
		[_vestRadio,[["rhs_mag_rgd5",2,1],[_mag,5,30]]],
		[],
		"rhs_tsh4",
		(if ((random 100 < 50) && (dax_p_nvg < 1)) then {_facewear} else {""}),
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_PILOT = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r,
		[],
		[],
		[_uniform,(_itemsU_base + _itemsU_tl)],
		[_vestRadio,[["rhs_mag_rgd5",2,1],[_mag,7,30]]],
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
		["rhs_weap_svdp_wd","","","rhs_acc_pso1m2",["rhs_10Rnd_762x54mmR_7N1",10],[],""],
		[],
		["rhs_weap_pb_6p9","rhs_acc_6p9_suppressor","","",["rhs_mag_9x18_8_57N181S",8],[],""],
		[_uniform,(_itemsU_base + _itemsU_tl)],
		[_vestRadio,[["ACE_Kestrel4500",1],["ACE_RangeCard",1],["rhs_mag_rgd5",2,1],["rhs_10Rnd_762x54mmR_7N1",11,10],["rhs_mag_9x18_8_57N181S",2,8]]],
		[],
		_headgear,
		(if ((random 100 < 50) && (dax_p_nvg < 1)) then {_facewear} else {""}),
		["ACE_Vector","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",(if (dax_p_nvg > 0) then {"NVGoggles_OPFOR"} else {""})]
	];
};

loadoutCC_OBS = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_akmn","",_lamp,"rhs_acc_ekp8_02",[_mag,30],[],"rhs_acc_pbs1"],
		[],
		[],
		[_uniform,(_itemsU_base + _itemsU_tl)],
		[_vestRadio,[["ACE_Kestrel4500",1],["rhs_mag_rgd5",2,1],[_mag,5,30]]],
		[_backpack_small,[[_mag,3,30],["ACE_HandFlare_Green",2,1]]],
		_headgear,
		(if ((random 100 < 50) && (dax_p_nvg < 1)) then {_facewear} else {""}),
		["ACE_Vector","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",(if (dax_p_nvg > 0) then {"NVGoggles_OPFOR"} else {""})]
	];
};

loadoutCC_JTAC = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r,
		[],
		[],
		[_uniform,(_itemsU_base + _itemsU_tl)],
		[_vestRadio,[["rhs_mag_rgd5",2,1],[_mag,5,30],["SmokeShellGreen",1,1]]],
		[_backpack_small,[["ACRE_PRC117F",1],["SmokeShellPurple",2,1],["SmokeShellGreen",4,1],["ACE_HandFlare_Green",4,1]]],
		_headgear,
		(if ((random 100 < 50) && (dax_p_nvg < 1)) then {_facewear} else {""}),
		["Laserdesignator_01_khk_F","","","",["Laserbatteries",1],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};
