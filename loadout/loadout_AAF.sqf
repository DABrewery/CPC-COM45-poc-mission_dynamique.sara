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
	_uniform ="";
	_backpack_big = "";
	_backpack_med = "";
	_backpack_small = "";
	_helmet = "";
	_hat = "";
	_cap = "";
	_vest_1 = "";
	_vest_2 = "";
	_weap_cco = [];
	_weap_rco = [];
	_weap_gl = [];
	_weap_c = "";

	switch (dax_p_nvg) do {
		case 0: {_nvg = ""; _lamp = "";};
		case 1: {_nvg = "NVGoggles_OPFOR"; _lamp = "acc_pointer_ir";};
		case 2: {_nvg = ""; _lamp = "acc_flashlight";};
		default {_nvg = ""; _lamp = "";};
	};
	
	_mag = "30Rnd_556x45_Stanag";
	switch (dax_loadoutcamo) do {
		case "jungle" : {
			_uniform = selectRandom ["U_MU_I_CombatUniform_para","U_MU_I_CombatUniform_para_vest"];
			_backpack_big = "B_Carryall_oli";
			_backpack_med = "B_Kitbag_rgr";
			_backpack_small = "B_AssaultPack_rgr";
			_helmet = "H_MU_HelmetB_light2";
			_hat = "H_Booniehat_oli";
			_cap = "H_MilCap_grn";
			_vest_1 = "V_MU_PlateCarrier2_2_rgr";
			_vest_2 = "V_MU_PlateCarrier2_2_rgr";
			_weap_cco = ["arifle_SPAR_01_blk_F","",_lamp,"optic_holosight_blk_f",[_mag,30],[],""];
			_weap_rco = ["arifle_SPAR_01_blk_F","",_lamp,"optic_mrco",[_mag,30],[],""];
			_weap_gl = ["arifle_SPAR_01_GL_blk_F","",_lamp,"optic_mrco",[_mag,30],["1Rnd_HE_Grenade_shell",1],""];
			_weap_c = "arifle_SPAR_01_blk_F";
		};
		case "desert" : {
			_uniform = selectRandom ["U_MU_I_CombatUniform_sand","U_MU_I_CombatUniform_sand_vest"];
			_backpack_big = "B_Carryall_cbr";
			_backpack_med = "B_Kitbag_cbr";
			_backpack_small = "B_AssaultPack_cbr";
			_helmet = "H_MU_HelmetB_light2_sand";
			_hat = "H_Booniehat_khk";
			_cap = "H_MU_MilCap_cbr";
			_vest_1 = "V_MU_PlateCarrier2_2_cbr";
			_vest_2 = "V_MU_PlateCarrier2_2_cbr";
			_weap_cco = ["arifle_Mk20_plain_F","",_lamp,"optic_holosight",[_mag,30],[],""];
			_weap_rco = ["arifle_Mk20_plain_F","",_lamp,"optic_mrco",[_mag,30],[],""];
			_weap_gl = ["arifle_Mk20_GL_plain_F","",_lamp,"optic_mrco",[_mag,30],["1Rnd_HE_Grenade_shell",1],""];
			_weap_c = "arifle_Mk20C_plain_F";
		};
		case "woodland";
		case "winter";
		case "polyvalent";
		default {
			_uniform = selectRandom ["U_I_CombatUniform","U_I_CombatUniform_shortsleeve"];
			_backpack_big = "B_Carryall_oli";
			_backpack_med = "B_Kitbag_rgr";
			_backpack_small = "B_AssaultPack_dgtl";
			_helmet = "H_HelmetIA";
			_hat = "H_Booniehat_dgtl";
			_cap = "H_MilCap_dgtl";
			_vest_1 = "V_PlateCarrierIA2_dgtl";
			_vest_2 = "V_PlateCarrierIA1_dgtl";
			_weap_cco = ["arifle_Mk20_F","",_lamp,"optic_aco_grn",[_mag,30],[],""];
			_weap_rco = ["arifle_Mk20_F","",_lamp,"optic_mrco",[_mag,30],[],""];
			_weap_gl = ["arifle_Mk20_GL_F","",_lamp,"optic_mrco",[_mag,30],["1Rnd_HE_Grenade_shell",1],""];
			_weap_c = "arifle_Mk20C_F";
		};
	};
	switch (cc_rhsennemy) do {
		case false: {
			_weap_lat = ["CUP_launch_M136","","","",[],[],""];
			_weap_at = ["launch_MRAWS_olive_rail_F","","","",["MRAWS_HEAT_F",1],[],""];
			_mun_at = [["MRAWS_HEAT_F",2,1],["MRAWS_HE_F",1,1]];
		};
		case true;
		default {
			_weap_lat = ["rhs_weap_M136","","","",[],[],""];
			_weap_at = ["rhs_weap_maaws","","","rhs_optic_maaws",["rhs_mag_maaws_HEAT",1],[],""];
			_mun_at = [["rhs_mag_maaws_HEAT",2,1],["rhs_mag_maaws_HEDP",1,1]];
		};
	};

	if (dax_p_nvg < 1) then {
		_facewear = selectRandomWeighted ["G_Shades_Red",0.3,"G_Shades_Green",0.3,"G_Shades_Blue",0.3,"G_Shades_Black",0.4,"",0.9];
	} else {
		_facewear = "";
	};

	_pistol = ["hgun_ACPC2_F","","","",["9Rnd_45ACP_Mag",8],[],""];

	_itemsU_base = [["ACE_fieldDressing",4],["ACE_tourniquet",1],["ACE_EarPlugs",1],["ACE_Flashlight_MX991",1],["ACRE_PRC343",1],["ACE_CableTie",1],["ACE_IR_Strobe_Item",1]];
	_itemsU_tl = _itemsU_base + [["ACRE_PRC148",1],["ACE_microDAGR",1],["ACE_MapTools",1]];
	_itemsV_base = [["HandGrenade",2,1],["SmokeShell",2,1],[_mag,7,30],["9Rnd_45ACP_Mag",2,8]];
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
		[_vest_2,[["HandGrenade",2,1],["SmokeShellGreen",4,1],[_mag,7,30],["9Rnd_45ACP_Mag",2,8]]],
		[_backpack_small,[["ACRE_PRC117F",1],["SmokeShellPurple",2,1]]],
		_cap,
		_facewear,
		["Rangefinder","","","",[],[],""],
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
		[_vest_1,[["HandGrenade",2,1],["SmokeShell",2,1],["SmokeShellGreen",2,1],[_mag,7,30],["9Rnd_45ACP_Mag",2,8]]],
		[],
		_helmet,
		_facewear,
		["Rangefinder","","","",[],[],""],
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
		["LMG_03_F","",_lamp,"optic_holosight_blk_f",["200Rnd_556x45_Box_Tracer_F",200],[],""],
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_1,[["HandGrenade",2,1],["SmokeShell",2,1],["200Rnd_556x45_Box_Tracer_F",1,200],["9Rnd_45ACP_Mag",2,8]]],
		[_backpack_small,[["200Rnd_556x45_Box_Tracer_F",2,200]]],
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
		[_vest_1,_itemsV_base],
		[_backpack_med,[["200Rnd_556x45_Box_Tracer_F",4,200]]],
		_helmet,
		_facewear,
		["Rangefinder","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};
loadoutCC_MG = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["LMG_Mk200_black_F","",_lamp,"optic_mrco",["200Rnd_65x39_cased_Box_Tracer",200],[],"bipod_03_f_blk"],
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_1,[["HandGrenade",2,1],["SmokeShell",2,1],["200Rnd_65x39_cased_Box_Tracer",1,200],["9Rnd_45ACP_Mag",2,8]]],
		[_backpack_small,[["200Rnd_65x39_cased_Box_Tracer",2,200]]],
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
		_weap_cco,
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_1,_itemsV_base],
		[_backpack_med,[["200Rnd_65x39_cased_Box_Tracer",4,200]]],
		_helmet,
		_facewear,
		["Rangefinder","","","",[],[],""],
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
		[_vest_1,_itemsV_base],
		[_backpack_big,_mun_at],
		_helmet,
		_facewear,
		["Rangefinder","","","",[],[],""],
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
		[_vest_1,_itemsV_base],
		[_backpack_big,_mun_at],
		_helmet,
		_facewear,
		["Rangefinder","","","",[],[],""],
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
		[_vest_1,_itemsV_base],
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
		["srifle_EBR_F","",_lamp,"optic_sos",["20Rnd_762x51_Mag",30],[],"bipod_03_f_blk"],
		[],
		_pistol,
		[_uniform,(_itemsU_base + [["optic_mrco",1],["ACE_Kestrel4500",1],["ACE_RangeCard",1]])],
		[_vest_1,[["HandGrenade",2,1],["SmokeShell",2,1],["20Rnd_762x51_Mag",5,20],["9Rnd_45ACP_Mag",2,8]]],
		[_backpack_small,[["20Rnd_762x51_Mag",2,20]]],
		_helmet,
		_facewear,
		["Rangefinder","","","",[],[],""],
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
		[_vest_1,[["HandGrenade",2,1],["SmokeShell",2,1],[_mag,7,30],["1Rnd_HE_Grenade_shell",4,1],["9Rnd_45ACP_Mag",2,8]]],
		[_backpack_med,[["1Rnd_HE_Grenade_shell",10,1],["1Rnd_SmokeRed_Grenade_shell",6,1],["UGL_FlareWhite_F",6,1],["ACE_HandFlare_Green",2,1],["HandGrenade",2,1],["SmokeShell",2,1]]],
		_helmet,
		_facewear,
		["Rangefinder","","","",[],[],""],
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
		[_vest_1,_itemsV_base],
		[_backpack_med,[[_mag,8,30],["SmokeShell",2,1],["HandGrenade",2,1],["ACE_HandFlare_Green",2,1]]],
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
		[_vest_1,_itemsV_base],
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
		[_vest_1,_itemsV_base],
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
		["V_TacVest_oli",[["HandGrenade",2,1],["SmokeShell",2,1],[_mag,5,30],["9Rnd_45ACP_Mag",2,8]]],
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
		["V_TacVest_oli",[["HandGrenade",2,1],["SmokeShell",2,1],[_mag,5,30],["9Rnd_45ACP_Mag",2,8]]],
		[],
		"H_PilotHelmetHeli_I",
		"",
		[],
		["ItemMap","","","ItemCompass","ACE_Altimeter",(if (dax_p_nvg > 0) then {_nvg} else {""})]
	];
};

loadoutCC_SNIPER = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["srifle_LRR_F","","","optic_lrps",["7Rnd_408_Mag",7],[],""],
		[],
		["hgun_Pistol_heavy_01_F","muzzle_snds_acp","acc_flashlight_pistol","",["11Rnd_45ACP_Mag",11],[],""],
		[_uniform,_itemsU_tl],
		["V_TacVest_oli",[["ACE_Kestrel4500",1],["ACE_RangeCard",1],["ACE_ATragMX",1],["SmokeShell",2,1],["HandGrenade",2,1],["7Rnd_408_Mag",2,7],["11Rnd_45ACP_Mag",4,11]]],
		[_backpack_small,[["optic_nightstalker",1],["7Rnd_408_Mag",5,7]]],
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
		[_weap_c,"muzzle_snds_m","acc_pointer_ir","optic_mrco",[_mag,30],[],""],
		[],
		["hgun_Pistol_heavy_01_F","muzzle_snds_acp","acc_flashlight_pistol","",["11Rnd_45ACP_Mag",11],[],""],
		[_uniform,_itemsU_tl],
		[_vest_1,[["ACE_Kestrel4500",1],["ACE_ATragMX",1],["HandGrenade",2,1],["SmokeShell",2,1],[_mag,7,30],["11Rnd_45ACP_Mag",2,11]]],
		[],
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
		_weap_cco,
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest_2,_itemsV_base],
		[_backpack_small,[["ACRE_PRC117F",1],["SmokeShellGreen",4,1],["ACE_HandFlare_Green",1,1]]],
		_helmet,
		_facewear,
		["Laserdesignator_01_khk_F","","","",["Laserbatteries",1],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};
