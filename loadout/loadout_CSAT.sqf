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
	_backpack_small = "";
	_helmet = "";
	_helmet_c = "";
	_vest_r = "";
	_vest_l = "";
	_vest_gl = "";
	_hat = "";
	_rifle = "";
	_rifle_ar = "";
	_rifle_m = "";
	_rifle_gl = "";
	_mag_ar = "";
	_at = "";
	_lat = "";
	_nvg = "";
	_lamp = "";
	_weap_lat = [];
	_weap_at = [];
	_mun_at = [];
	_facewear =  "";

	switch (dax_p_nvg) do {
		case 0: {_nvg = ""; _lamp = "";};
		case 1: {_nvg = "NVGoggles_OPFOR"; _lamp = "acc_pointer_ir";};
		case 2: {_nvg = ""; _lamp = "acc_flashlight";};
		default {_nvg = ""; _lamp = "";};
	};
	
	switch (dax_loadoutcamo) do {
		case "jungle": {
			_uniform = "U_O_T_Soldier_F";
			_backpack_big = "B_Carryall_ghex_F";
			_backpack_small = "B_FieldPack_ghex_F";
			_helmet = "H_HelmetO_ghex_F";
			_helmet_c = "H_HelmetCrew_O_ghex_F";
			_hat = "H_MilCap_ghex_F";
			_vest_r = "V_HarnessO_ghex_F";
			_vest_gl = "V_HarnessOGL_ghex_F";
			_vest_l = "V_TacVest_oli";
			_rifle = "arifle_CTAR_ghex_F";
			_rifle_ar = "arifle_CTARS_ghex_F";
			_rifle_m = "srifle_DMR_07_ghex_F";
			_rifle_gl = "arifle_CTAR_GL_ghex_F";
			_mag_ar = "100Rnd_580x42_ghex_Mag_F";
			_at = "launch_RPG32_ghex_F";
			_lat = "launch_O_Titan_short_ghex_F";
		};
		case "winter": {
			_uniform = "U_O_CombatUniform_oucamo";
			_backpack_big = "B_Carryall_oucamo";
			_backpack_small = "B_FieldPack_oucamo";
			_helmet = "H_HelmetO_oucamo";
			_helmet_c = "H_HelmetCrew_B";
			_hat = "H_MilCap_gry";
			_vest_r = "V_HarnessO_gry";
			_vest_gl = "V_HarnessOGL_gry";
			_vest_l = "V_TacVest_blk";
			_rifle = "arifle_CTAR_blk_F";
			_rifle_ar = "arifle_CTARS_blk_F";
			_rifle_m = "srifle_DMR_07_blk_F";
			_rifle_gl = "arifle_CTAR_GL_blk_F";
			_mag_ar = "100Rnd_580x42_Mag_F";
			_at = "launch_RPG32_F";
			_lat = "launch_O_Titan_short_F";
		};
		case "woodland";
		case "desert";
		case "polyvalent";
		default {
			_uniform = "U_O_CombatUniform_ocamo";
			_backpack_big = "B_Carryall_ocamo";
			_backpack_small = "B_FieldPack_ocamo";
			_helmet = "H_HelmetO_ocamo";
			_helmet_c = "H_HelmetCrew_O";
			_hat = "H_MilCap_ocamo";
			_vest_r = "V_HarnessO_brn";
			_vest_gl = "V_HarnessOGL_brn";
			_vest_l = "V_TacVest_khk";
			_rifle = "arifle_CTAR_hex_F";
			_rifle_ar = "arifle_CTARS_hex_F";
			_rifle_m = "srifle_DMR_07_hex_F";
			_rifle_gl = "arifle_CTAR_GL_hex_F";
			_mag_ar = "100Rnd_580x42_hex_Mag_F";
			_at = "launch_RPG32_F";
			_lat = "launch_O_Titan_short_F";
		};
	};
	switch (cc_rhsennemy) do {
		case false: {
			_weap_lat = [_lat,"","","",["Titan_AT",1],[],""];
			_weap_at = [_at,"","","",["RPG32_F",1],[],""];
			_mun_at = [["RPG32_F",2,1],["RPG32_HE_F",1,1]];
		};
		case true;
		default {
			_weap_lat = ["rhs_weap_rpg26","","","",[],[],""];
			_weap_at = ["rhs_weap_rpg7","","","rhs_acc_pgo7v3",["rhs_rpg7_PG7VL_mag",1],[],""];
			_mun_at = [["rhs_rpg7_PG7VL_mag",1,1],["rhs_rpg7_TBG7V_mag",1,1],["rhs_rpg7_PG7VR_mag",1,1]];
		};
	};

	_facewear = "";

	_mag = "30Rnd_580x42_Mag_F";
	_weap_cco = [_rifle,"",_lamp,"optic_aco_grn",[_mag,30],[],""];
	_weap_rco = [_rifle,"",_lamp,"optic_arco_blk_f",[_mag,30],[],""];
	_weap_ar = [_rifle_ar,"",_lamp,"optic_aco_grn",[_mag_ar,100],[],""];
	_weap_mg = ["LMG_Zafir_F","",_lamp,"optic_arco_blk_f",["150Rnd_762x54_Box_Tracer",150],[],""];
	_weap_m = [_rifle_m,"","","optic_dms",["20Rnd_650x39_Cased_Mag_F",20],[],""];
	_weap_gl = [_rifle_gl,"",_lamp,"optic_arco_blk_f",[_mag,30],["1Rnd_HE_Grenade_shell",1],""];
	_pistol = ["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""];

	_itemsU_base = [["ACE_fieldDressing",4],["ACE_tourniquet",1],["ACE_EarPlugs",1],["ACE_Flashlight_MX991",1],["ACRE_PRC343",1],["ACE_CableTie",1],["ACE_IR_Strobe_Item",1]];
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
		[_vest_l,[["HandGrenade",2,1],["SmokeShellGreen",3,1],[_mag,7,30],["16Rnd_9x21_Mag",2,17]]],
		[_backpack_small,[["ACRE_PRC117F",1],["SmokeShellPurple",2,1]]],
		_hat,
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
		[_vest_r,[["HandGrenade",2,1],["SmokeShell",2,1],["SmokeShellGreen",2,1],[_mag,7,30],["16Rnd_9x21_Mag",2,17]]],
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
		[_vest_l,_itemsV_base],
		[_backpack_big,_itemsB_medic],
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
		_weap_ar,
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_r,[["HandGrenade",2,1],["SmokeShell",2,1],[_mag_ar,6,100],["16Rnd_9x21_Mag",2,17]]],
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
		_weap_cco,
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_r,_itemsV_base],
		[_backpack_small,[[_mag_ar,6,100]]],
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
		_weap_mg,
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_r,[["HandGrenade",2,1],["SmokeShell",2,1],["150Rnd_762x54_Box_Tracer",2,150],["16Rnd_9x21_Mag",2,17]]],
		[_backpack_small,[["150Rnd_762x54_Box_Tracer",1,150]]],
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
		[_vest_r,_itemsV_base],
		[_backpack_small,[["150Rnd_762x54_Box_Tracer",4,150]]],
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
		[_vest_l,_itemsV_base],
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
		[_vest_l,_itemsV_base],
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
		[_vest_r,_itemsV_base],
		[_backpack_small,[["ACE_M26_Clacker",1],["ACE_DefusalKit",1],["ACE_EntrenchingTool",1],["SatchelCharge_Remote_Mag",1,1],["DemoCharge_Remote_Mag",2,1]]],
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
		_pistol,
		[_uniform,(_itemsU_base + [["optic_nvs",1],["ACE_Kestrel4500",1],["ACE_RangeCard",1]])],
		[_vest_r,[["HandGrenade",2,1],["SmokeShell",2,1],["20Rnd_650x39_Cased_Mag_F",9,20],["16Rnd_9x21_Mag",2,17]]],
		[],
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
		[_vest_gl,[["HandGrenade",2,1],["SmokeShell",2,1],[_mag,7,30],["1Rnd_HE_Grenade_shell",4,1],["16Rnd_9x21_Mag",2,17]]],
		[_backpack_small,[["1Rnd_HE_Grenade_shell",10,1],["1Rnd_SmokeRed_Grenade_shell",6,1],["UGL_FlareWhite_F",6,1],["ACE_HandFlare_Green",2,1],["HandGrenade",2,1],["SmokeShell",2,1]]],
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
		[_vest_r,_itemsV_base],
		[_backpack_small,[[_mag,8,30],["SmokeShell",2,1],["HandGrenade",2,1],["ACE_HandFlare_Green",2,1]]],
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
		[_vest_l,[["HandGrenade",2,1],["SmokeShell",2,1],[_mag,5,30],["16Rnd_9x21_Mag",2,17]]],
		[],
		_helmet_c,
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
		[_vest_l,[["HandGrenade",2,1],["SmokeShell",2,1],[_mag,5,30],["16Rnd_9x21_Mag",2,17]]],
		[],
		"H_PilotHelmetHeli_O",
		"",
		[],
		["ItemMap","","","ItemCompass","ACE_Altimeter",(if (dax_p_nvg > 0) then {_nvg} else {""})]
	];
};

loadoutCC_SNIPER = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["srifle_GM6_F","","","optic_lrps",["5Rnd_127x108_Mag",5],[],""],
		[],
		["hgun_Rook40_F","muzzle_snds_l","","",["16Rnd_9x21_Mag",17],[],""],
		[_uniform,_itemsU_tl],
		[_vest_l,[["ACE_Kestrel4500",1],["ACE_RangeCard",1],["ACE_ATragMX",1],["SmokeShell",2,1],["HandGrenade",2,1],["5Rnd_127x108_Mag",2,5],["16Rnd_9x21_Mag",4,17]]],
		[_backpack_small,[["optic_nightstalker",1],["5Rnd_127x108_Mag",2,5],["5Rnd_127x108_APDS_Mag",2,5]]],
		_helmet,
		_facewear,
		["Rangefinder","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",(if (dax_p_nvg > 0) then {"NVGoggles_OPFOR"} else {""})]
	];
};

loadoutCC_OBS = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["arifle_Katiba_C_F","muzzle_snds_65_ti_blk_f","acc_pointer_ir","optic_arco_blk_f",["30Rnd_65x39_caseless_green",30],[],""],
		[],
		["hgun_Rook40_F","muzzle_snds_l","","",["16Rnd_9x21_Mag",17],[],""],
		[_uniform,_itemsU_tl],
		[_vest_r,[["ACE_Kestrel4500",1],["ACE_ATragMX",1],["HandGrenade",2,1],["SmokeShell",2,1],["30Rnd_65x39_caseless_green",7,30],["16Rnd_9x21_Mag",2,17]]],
		[],
		_helmet,
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
		[_vest_l,_itemsV_base],
		[_backpack_small,[["ACRE_PRC117F",1],["SmokeShellGreen",4,1],["ACE_HandFlare_Green",1,1]]],
		_helmet,
		_facewear,
		["Laserdesignator_01_khk_F","","","",["Laserbatteries",1],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};