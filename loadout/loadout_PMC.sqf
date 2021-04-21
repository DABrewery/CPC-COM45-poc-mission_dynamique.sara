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
	_vest_r = "";
	_vest_ar = "";
	_vest_gl = "";
	_vest_tl = "";
	_vest_l = "";
	_camo = "";
	_nvg = "";
	_lamp = "";
	_weap_r = "";
	_weap_gl = "";
	_mag = "";
	_cco = "";
	_rco = "";
	_weap_lat = [];
	_weap_at = [];
	_mun_at = [];
	_facewear =  [];

	switch (dax_p_nvg) do {
		case 0: {_nvg = ""; _lamp = "";};
		case 1: {_nvg = "CUP_NVG_PVS15_black"; _lamp = "cup_acc_flashlight";};
		case 2: {_nvg = ""; _lamp = "acc_flashlight";};
		default {_nvg = ""; _lamp = "";};
	};
	
	switch (dax_loadoutcamo) do {
		case "winter": {
			_uniform = selectRandom ["CUP_I_B_PMC_Unit_33","CUP_I_B_PMC_Unit_29","CUP_I_B_PMC_Unit_25","CUP_I_B_PMC_Unit_30"];
			_backpack_big = "CPC_Snow_Backpack_1";
			_backpack_med = selectRandom ["B_MU_Kitbag_blk","B_Kitbag_sgg"];
			_backpack_small = selectRandom ["B_AssaultPack_blk","B_AssaultPack_sgg"];
			_helmet = selectRandom ["CUP_H_FR_BeanieGreen","CUP_H_PMC_Beanie_Headphones_Winter","CUP_H_PMC_Beanie_Headphones_Khaki","CUP_H_PMC_Beanie_Headphones_Black","H_Watchcap_khk","H_Watchcap_blk"];
			_facewear = [];
			_vest_r = "CUP_V_PMC_CIRAS_Winter_Patrol";
			_vest_tl = "CUP_V_PMC_CIRAS_Winter_TL";
			_vest_gl = "CUP_V_PMC_CIRAS_Winter_Grenadier";
			_vest_l = "CUP_V_PMC_CIRAS_Winter_Veh";
			_vest_ar = _vest_r;
			_camo = "black";
		};
		case "desert": {
			_uniform = selectRandom ["CUP_I_B_PMC_Unit_32","CUP_I_B_PMC_Unit_31","CUP_I_B_PMC_Unit_12","CUP_I_B_PMC_Unit_9","CUP_I_B_PMC_Unit_10","CUP_I_B_PMC_Unit_11","CUP_I_B_PMC_Unit_15","CUP_I_B_PMC_Unit_16","CUP_I_B_PMC_Unit_14","CUP_I_B_PMC_Unit_13","CUP_I_B_PMC_Unit_17","CUP_I_B_PMC_Unit_19","CUP_I_B_PMC_Unit_21","CUP_I_B_PMC_Unit_22","CUP_I_B_PMC_Unit_20"];
			_backpack_big = selectRandom ["B_Carryall_cbr","B_Carryall_khk"];
			_backpack_med = selectRandom ["B_Kitbag_cbr","B_Kitbag_rgr","B_Kitbag_mcamo"];
			_backpack_small = selectRandom ["B_AssaultPack_blk","B_AssaultPack_cbr","B_AssaultPack_rgr","B_AssaultPack_khk"];
			_helmet = selectRandom ["H_Cap_oli_hs","CUP_H_RUS_Bandana_HS","H_Bandanna_khk_hs","CUP_H_PMC_Cap_Back_EP_Grey","CUP_H_PMC_Cap_Back_EP_Tan","CUP_H_PMC_Cap_Back_PRR_Grey","CUP_H_PMC_Cap_Back_PRR_Tan","CUP_H_PMC_Cap_EP_Grey","CUP_H_PMC_Cap_EP_Tan","CUP_H_PMC_Cap_PRR_Grey","CUP_H_PMC_Cap_PRR_Tan"];
			_facewear = ["CUP_TK_NeckScarf","CUP_FR_NeckScarf5","CUP_FR_NeckScarf2","CUP_FR_NeckScarf"];
			_vest_r = selectRandom ["CUP_V_PMC_CIRAS_Black_Patrol","CUP_V_PMC_CIRAS_Coyote_Patrol","CUP_V_PMC_IOTV_Black_Patrol","CUP_V_PMC_IOTV_Coyote_Patrol"];
			_vest_tl = selectRandom ["CUP_V_PMC_CIRAS_Black_TL","CUP_V_PMC_CIRAS_Coyote_TL","CUP_V_PMC_IOTV_Black_TL","CUP_V_PMC_IOTV_Coyote_TL"];
			_vest_gl = selectRandom ["CUP_V_PMC_CIRAS_Black_Grenadier","CUP_V_PMC_CIRAS_Coyote_Grenadier","CUP_V_PMC_IOTV_Black_Grenadier","CUP_V_PMC_IOTV_Coyote_Grenadier"];
			_vest_l = selectRandom ["CUP_V_PMC_CIRAS_Black_Veh","CUP_V_PMC_CIRAS_Coyote_Veh"];
			_vest_ar = selectRandom ["CUP_V_PMC_IOTV_Black_AR","CUP_V_PMC_IOTV_Coyote_AR"];
			_camo = selectrandom ["black","tan"];
		};
		case "woodland";
		case "jungle": {
			_uniform = selectRandom ["CUP_I_B_PMC_Unit_32","CUP_I_B_PMC_Unit_31","CUP_I_B_PMC_Unit_23","CUP_I_B_PMC_Unit_12","CUP_I_B_PMC_Unit_9","CUP_I_B_PMC_Unit_10","CUP_I_B_PMC_Unit_11","CUP_I_B_PMC_Unit_15","CUP_I_B_PMC_Unit_16","CUP_I_B_PMC_Unit_14","CUP_I_B_PMC_Unit_13","CUP_I_B_PMC_Unit_17","CUP_I_B_PMC_Unit_19","CUP_I_B_PMC_Unit_21","CUP_I_B_PMC_Unit_22","CUP_I_B_PMC_Unit_20"];
			_backpack_big = selectRandom ["B_Carryall_oli","B_Carryall_cbr","B_Carryall_khk"];
			_backpack_med = selectRandom ["B_Kitbag_cbr","B_Kitbag_rgr","B_Kitbag_mcamo"];
			_backpack_small = selectRandom ["B_AssaultPack_blk","B_AssaultPack_cbr","B_AssaultPack_rgr","B_AssaultPack_khk"];
			_helmet = selectRandom ["H_Cap_oli_hs","CUP_H_RUS_Bandana_HS","H_Bandanna_khk_hs","H_Watchcap_khk","H_Watchcap_camo","H_Watchcap_cbr","H_Watchcap_blk","CUP_H_PMC_Beanie_Headphones_Black","CUP_H_PMC_Beanie_Headphones_Khaki","CUP_H_PMC_Cap_Back_EP_Grey","CUP_H_PMC_Cap_Back_EP_Tan","CUP_H_PMC_Cap_Back_PRR_Grey","CUP_H_PMC_Cap_Back_PRR_Tan","CUP_H_PMC_Cap_EP_Grey","CUP_H_PMC_Cap_EP_Tan","CUP_H_PMC_Cap_PRR_Grey","CUP_H_PMC_Cap_PRR_Tan"];
			_facewear = ["CUP_TK_NeckScarf","CUP_FR_NeckScarf2","CUP_FR_NeckScarf"];
			_vest_r = selectRandom ["CUP_V_PMC_CIRAS_Black_Patrol","CUP_V_PMC_CIRAS_Coyote_Patrol","CUP_V_PMC_IOTV_Black_Patrol","CUP_V_PMC_IOTV_Coyote_Patrol"];
			_vest_tl = selectRandom ["CUP_V_PMC_CIRAS_Black_TL","CUP_V_PMC_CIRAS_Coyote_TL","CUP_V_PMC_IOTV_Black_TL","CUP_V_PMC_IOTV_Coyote_TL"];
			_vest_gl = selectRandom ["CUP_V_PMC_CIRAS_Black_Grenadier","CUP_V_PMC_CIRAS_Coyote_Grenadier","CUP_V_PMC_IOTV_Black_Grenadier","CUP_V_PMC_IOTV_Coyote_Grenadier"];
			_vest_l = selectRandom ["CUP_V_PMC_CIRAS_Black_Veh","CUP_V_PMC_CIRAS_Coyote_Veh"];
			_vest_ar = selectRandom ["CUP_V_PMC_IOTV_Black_AR","CUP_V_PMC_IOTV_Coyote_AR"];
			_camo = selectrandom ["black","black","od"];
		};
		case "polyvalent";
		default {
			_uniform = selectRandom ["CUP_I_B_PMC_Unit_32","CUP_I_B_PMC_Unit_31","CUP_I_B_PMC_Unit_23","CUP_I_B_PMC_Unit_12","CUP_I_B_PMC_Unit_9","CUP_I_B_PMC_Unit_10","CUP_I_B_PMC_Unit_11","CUP_I_B_PMC_Unit_15","CUP_I_B_PMC_Unit_16","CUP_I_B_PMC_Unit_14","CUP_I_B_PMC_Unit_13","CUP_I_B_PMC_Unit_17","CUP_I_B_PMC_Unit_19","CUP_I_B_PMC_Unit_21","CUP_I_B_PMC_Unit_22","CUP_I_B_PMC_Unit_20"];
			_backpack_big = selectRandom ["B_Carryall_oli","B_Carryall_cbr","B_Carryall_khk"];
			_backpack_med = selectRandom ["B_Kitbag_cbr","B_Kitbag_rgr","B_Kitbag_mcamo"];
			_backpack_small = selectRandom ["B_AssaultPack_blk","B_AssaultPack_cbr","B_AssaultPack_rgr","B_AssaultPack_khk"];
			_helmet = selectRandom ["H_Cap_oli_hs","CUP_H_RUS_Bandana_HS","H_Bandanna_khk_hs","H_Watchcap_khk","H_Watchcap_camo","H_Watchcap_cbr","H_Watchcap_blk","CUP_H_PMC_Beanie_Headphones_Black","CUP_H_PMC_Beanie_Headphones_Khaki","CUP_H_PMC_Cap_Back_EP_Grey","CUP_H_PMC_Cap_Back_EP_Tan","CUP_H_PMC_Cap_Back_PRR_Grey","CUP_H_PMC_Cap_Back_PRR_Tan","CUP_H_PMC_Cap_EP_Grey","CUP_H_PMC_Cap_EP_Tan","CUP_H_PMC_Cap_PRR_Grey","CUP_H_PMC_Cap_PRR_Tan"];
			_facewear = ["CUP_TK_NeckScarf","CUP_FR_NeckScarf5","CUP_FR_NeckScarf2","CUP_FR_NeckScarf"];
			_vest_r = selectRandom ["CUP_V_PMC_CIRAS_Black_Patrol","CUP_V_PMC_CIRAS_Coyote_Patrol","CUP_V_PMC_IOTV_Black_Patrol","CUP_V_PMC_IOTV_Coyote_Patrol"];
			_vest_tl = selectRandom ["CUP_V_PMC_CIRAS_Black_TL","CUP_V_PMC_CIRAS_Coyote_TL","CUP_V_PMC_IOTV_Black_TL","CUP_V_PMC_IOTV_Coyote_TL"];
			_vest_gl = selectRandom ["CUP_V_PMC_CIRAS_Black_Grenadier","CUP_V_PMC_CIRAS_Coyote_Grenadier","CUP_V_PMC_IOTV_Black_Grenadier","CUP_V_PMC_IOTV_Coyote_Grenadier"];
			_vest_l = selectRandom ["CUP_V_PMC_CIRAS_Black_Veh","CUP_V_PMC_CIRAS_Coyote_Veh"];
			_vest_ar = selectRandom ["CUP_V_PMC_IOTV_Black_AR","CUP_V_PMC_IOTV_Coyote_AR"];
			_camo = selectrandom ["black","tan","od"];
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
		_facewear = selectrandom (_facewear + ["CUP_G_Oakleys_Drk","CUP_G_Oakleys_Embr","G_Shades_Red","G_Shades_Green","G_Shades_Black"]);
	} else {
		_facewear = selectrandom _facewear;
	};

	switch (_camo) do {
		case "black": {
			_weap_r = selectrandom ["CUP_arifle_HK416_Black","CUP_arifle_M4A3_black"];
			_weap_gl = selectrandom ["CUP_arifle_HK416_M203_Black","CUP_arifle_M4A1_BUIS_GL"];
			_mag = selectrandom ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_PMAG_QP","CUP_30Rnd_556x45_Emag"];
			_cco = selectrandom ["cup_optic_compm2_low","cup_optic_compm2_low","cup_optic_eotech553_black","cup_optic_microt1"];
			_rco = selectrandom ["cup_optic_elcan","cup_optic_acog"];
		};
		case "tan": {
			_weap_r = selectrandom ["CUP_arifle_HK416_Desert","CUP_arifle_M4A3_desert"];
			_weap_gl = selectrandom ["CUP_arifle_HK416_CQB_M203_Desert","CUP_arifle_M4A1_BUIS_desert_GL"];
			_mag = selectrandom ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_PMAG_QP_Tan","CUP_30Rnd_556x45_EMAG_Tan"];
			_cco = selectrandom ["cup_optic_compm2_low_coyote","cup_optic_compm2_low_coyote","cup_optic_eotech553_black","cup_optic_microt1"];
			_rco = selectrandom ["cup_optic_elcan_coyote","cup_optic_acog_reflex_desert"];
		};
		case "od": {
			_weap_r = selectrandom ["CUP_arifle_HK416_Wood","CUP_arifle_M4A3_camo"];
			_weap_gl = selectrandom ["CUP_arifle_HK416_M203_Wood","CUP_arifle_M4A1_BUIS_camo_GL"];
			_mag = selectrandom ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_PMAG_QP_Olive","CUP_30Rnd_556x45_EMAG_Olive"];
			_cco = selectrandom ["cup_optic_compm2_low_od","cup_optic_compm2_low_od","cup_optic_eotech553_black","cup_optic_microt1"];
			_rco = selectrandom ["cup_optic_elcan_od","cup_optic_acog_reflex_wood"];
		};
	};

	_weap_cco = [_weap_r,"",_lamp,_cco,[_mag,30],[],""];
	_weap_rco = [_weap_r,"",_lamp,_rco,[_mag,30],[],""];
	_weap_gl = [_weap_gl,"",_lamp,_cco,[_mag,30],["CUP_1Rnd_HEDP_M203",1],""];
	_pistol = ["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""];

	_itemsU_base = [["ACE_fieldDressing",4],["ACE_tourniquet",1],["ACE_EarPlugs",1],["ACE_Flashlight_MX991",1],["ACRE_PRC343",1],["ACE_CableTie",1],["ACE_IR_Strobe_Item",1],["SmokeShell",1,1]];
	_itemsU_tl = _itemsU_base + [["ACRE_PRC148",1],["ACE_microDAGR",1],["ACE_MapTools",1]];
	_itemsV_base = [["HandGrenade",2,1],["SmokeShell",2,1],[_mag,7,30],["16Rnd_9x21_Mag",2,17]];
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
		_weap_cco,
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest_tl,[["HandGrenade",1,1],["SmokeShellGreen",4,1],[_mag,7,30],["16Rnd_9x21_Mag",2,17]]],
		[_backpack_small,[["ACRE_PRC117F",1],["SmokeShellPurple",2,1]]],
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
		[_vest_tl,[["HandGrenade",2,1],["SmokeShellGreen",4,1],[_mag,7,30],["16Rnd_9x21_Mag",2,17]]],
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
		[_vest_r,_itemsV_base],
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
		["CUP_lmg_m249_pip1","","","cup_optic_eotech553_black",["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",200],[],""],
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_ar,[["HandGrenade",2,1],["SmokeShell",2,1],["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",1,200],["16Rnd_9x21_Mag",2,17]]],
		[_backpack_small,[["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",2,200]]],
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
		[_backpack_med,[["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",4,200]]],
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
		["CUP_lmg_MG3_rail","",_lamp,"cup_optic_elcanm145",["CUP_120Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",120],[],""],
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_ar,[["HandGrenade",2,1],["SmokeShell",2,1],["CUP_120Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",1,120],["16Rnd_9x21_Mag",2,17]]],
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
		_weap_rco,
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_r,_itemsV_base],
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
		_weap_cco,
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
		["CUP_arifle_HK417_20","",_lamp,"cup_optic_sb_11_4x20_pm",["CUP_20Rnd_762x51_HK417",20],[],"bipod_01_f_blk"],
		[],
		_pistol,
		[_uniform,(_itemsU_base + [["ACE_Kestrel4500",1],["ACE_RangeCard",1]])],
		[_vest_r,[["HandGrenade",2,1],["SmokeShell",2,1],["CUP_20Rnd_762x51_HK417",4,20],["16Rnd_9x21_Mag",2,17]]],
		[_backpack_small,[["cup_optic_elcan_reflex",1],["CUP_20Rnd_TE1_Red_Tracer_762x51_HK417",5,20]]],
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
		_weap_gl,
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_gl,[["HandGrenade",2,1],["SmokeShell",2,1],[_mag,5,30],["CUP_1Rnd_HEDP_M203",4,1],["16Rnd_9x21_Mag",2,17]]],
		[_backpack_med,[[_mag,4,30],["CUP_1Rnd_HEDP_M203",5,1],["CUP_1Rnd_SmokeRed_M203",6,1],["CUP_1Rnd_StarCluster_White_M203",6,1],["ACE_HandFlare_Green",2,1],["HandGrenade",2,1],["SmokeShell",2,1]]],
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
		[_backpack_big,[[_mag,8,30],["SmokeShell",2,1],["HandGrenade",2,1],["ACE_HandFlare_Green",2,1]]],
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
		_weap_cco,
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
		_weap_cco,
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest_l,[["HandGrenade",1,1],["SmokeShell",1,1],[_mag,4,30],["16Rnd_9x21_Mag",2,17]]],
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
		_weap_cco,
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest_l,[["HandGrenade",1,1],["SmokeShell",1,1],[_mag,4,30],["16Rnd_9x21_Mag",2,17]]],
		[],
		"H_PilotHelmetHeli_B",
		"",
		[],
		["ItemMap","","","ItemCompass","ACE_Altimeter",(if (dax_p_nvg > 0) then {"CUP_NVG_PVS15_black"} else {""})]
	];
};

loadoutCC_SNIPER = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["srifle_LRR_F","","","optic_lrps",["7Rnd_408_Mag",7],[],""],
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest_l,[["ACE_Kestrel4500",1],["ACE_RangeCard",1],["ACE_ATragMX",1],["SmokeShell",2,1],["HandGrenade",2,1],["7Rnd_408_Mag",1,7],["16Rnd_9x21_Mag",4,17]]],
		[_backpack_small,[["cup_optic_an_pvs_4",1],["7Rnd_408_Mag",6,7]]],
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
		["CUP_arifle_HK416_CQB_Black","cup_muzzle_snds_m16","cup_acc_anpeq_15_black","cup_optic_elcan_reflex",["CUP_30Rnd_556x45_PMAG_QP",30],[],""],
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest_l,[["ACE_Kestrel4500",1],["ACE_ATragMX",1],["HandGrenade",2,1],["SmokeShell",2,1],["CUP_30Rnd_556x45_PMAG_QP",3,30],["16Rnd_9x21_Mag",2,17]]],
		[_backpack_med,[["CUP_30Rnd_556x45_PMAG_QP",4,30]]],
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
		_weap_cco,
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest_r,[["HandGrenade",2,1],["SmokeShell",2,1],[_mag,7,30],["16Rnd_9x21_Mag",2,17]]],
		[_backpack_small,[["ACRE_PRC117F",1],["SmokeShellGreen",4,1],["ACE_HandFlare_Green",1,1]]],
		_helmet,
		_facewear,
		["Laserdesignator_01_khk_F","","","",["Laserbatteries",1],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};
