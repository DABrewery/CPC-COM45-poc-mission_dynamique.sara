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
	_vest_1 = "";
	_vest_2 = "";
	_hat = "";
	_rifle = "";
	_rifle_s = "";
	_rifle_ar = "";
	_rifle_m = "";
	_rifle_gl = "";
	_mag = "";
	_mag_ar = "";
	_cco = "";
	_bipod = "";
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
			_uniform = selectRandom ["U_B_T_Soldier_F","U_B_T_Soldier_SL_F","U_B_T_Soldier_AR_F"];
			_backpack_big = "B_Carryall_oli";
			_backpack_med = "B_Kitbag_sgg";
			_backpack_small = "B_AssaultPack_tna_F";
			_helmet = "H_HelmetB_Enh_tna_F";
			_hat = "H_Booniehat_tna_F";
			_vest_1 = "V_PlateCarrier2_tna_F";
			_vest_2 = "V_PlateCarrier1_tna_F";
			_rifle = "arifle_MX_khk_F";
			_rifle_s = "arifle_MXC_khk_F";
			_rifle_ar = "arifle_MX_SW_khk_F";
			_rifle_m = "arifle_MXM_khk_F";
			_rifle_gl = "arifle_MX_GL_khk_F";
			_mag = "30Rnd_65x39_caseless_khaki_mag";
			_mag_ar = "100Rnd_65x39_caseless_khaki_mag";
			_cco = "optic_holosight_khk_f";
			_bipod = "bipod_01_f_khk";
		};
		case "woodland": {
			_uniform = selectRandom ["U_MU_B_soldier_wdl","U_MU_B_soldier_wdl_vest"];
			_backpack_big = "B_Carryall_oli";
			_backpack_med = "B_Kitbag_rgr";
			_backpack_small = "B_AssaultPack_rgr";
			_helmet = selectRandom ["H_HelmetSpecB","H_HelmetSpecB_snakeskin","H_HelmetB_camo"];
			_hat = "H_Booniehat_oli";
			_vest_1 = "V_PlateCarrier2_rgr";
			_vest_2 = "V_PlateCarrier1_rgr";
			_rifle = "arifle_MX_Black_F";
			_rifle_s = "arifle_MXC_Black_F";
			_rifle_ar = "arifle_MX_SW_Black_F";
			_rifle_m = "arifle_MXM_Black_F";
			_rifle_gl = "arifle_MX_GL_Black_F";
			_mag = "30Rnd_65x39_caseless_black_mag";
			_mag_ar = "100Rnd_65x39_caseless_black_mag";
			_cco = "optic_holosight_blk_f";
			_bipod = "bipod_01_f_blk";
		};
		case "winter": {
			_uniform = selectRandom ["U_MU_B_soldier_sage","U_MU_B_soldier_sage_vest"];
			_backpack_big = "B_Carryall_khk";
			_backpack_med = "B_Kitbag_sgg";
			_backpack_small = "B_AssaultPack_sgg";
			_helmet = "H_HelmetSpecB";
			_hat = "H_Watchcap_camo";
			_vest_1 = "V_PlateCarrier2_rgr";
			_vest_2 = "V_PlateCarrier1_rgr";
			_rifle = "arifle_MX_Black_F";
			_rifle_s = "arifle_MXC_Black_F";
			_rifle_ar = "arifle_MX_SW_Black_F";
			_rifle_m = "arifle_MXM_Black_F";
			_rifle_gl = "arifle_MX_GL_Black_F";
			_mag = "30Rnd_65x39_caseless_black_mag";
			_mag_ar = "100Rnd_65x39_caseless_black_mag";
			_cco = "optic_holosight_blk_f";
			_bipod = "bipod_01_f_blk";
		};
		case "desert": {
			_uniform = selectRandom ["U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_vest","U_B_CombatUniform_mcam_tshirt"];
			_backpack_big = "B_Carryall_cbr";
			_backpack_med = "B_Kitbag_mcamo";
			_backpack_small = "B_AssaultPack_cbr";
			_helmet = selectRandom ["H_HelmetSpecB_sand","H_HelmetSpecB_paint2"];
			_hat = "H_Booniehat_tan";
			_vest_1 = "V_MU_PlateCarrier2_khk";
			_vest_2 = "V_MU_PlateCarrier1_khk";
			_rifle = "arifle_MX_F";
			_rifle_s = "arifle_MXC_F";
			_rifle_ar = "arifle_MX_SW_F";
			_rifle_m = "arifle_MXM_F";
			_rifle_gl = "arifle_MX_GL_F";
			_mag = "30Rnd_65x39_caseless_mag";
			_mag_ar = "100Rnd_65x39_caseless_mag_Tracer";
			_cco = "optic_holosight";
			_bipod = "bipod_01_f_snd";
		};
		case "polyvalent";
		default {
			_uniform = selectRandom ["U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_vest"];
			_backpack_big = "B_Carryall_mcamo";
			_backpack_med = "B_Kitbag_mcamo";
			_backpack_small = "B_AssaultPack_mcamo";
			_helmet = selectRandom ["H_HelmetSpecB","H_HelmetSpecB_blk","H_HelmetSpecB_paint1","H_HelmetSpecB_snakeskin","H_HelmetB_camo"];
			_hat = "H_Booniehat_mcamo";
			_vest_1 = "V_PlateCarrier2_rgr";
			_vest_2 = "V_PlateCarrier1_rgr";
			_rifle = "arifle_MX_F";
			_rifle_s = "arifle_MXC_F";
			_rifle_ar = "arifle_MX_SW_F";
			_rifle_m = "arifle_MXM_F";
			_rifle_gl = "arifle_MX_GL_F";
			_mag = "30Rnd_65x39_caseless_mag";
			_mag_ar = "100Rnd_65x39_caseless_mag_Tracer";
			_cco = "optic_holosight";
			_bipod = "bipod_01_f_snd";
		};
	};
	switch (cc_rhsennemy) do {
		case false: {
			_weap_lat = ["CUP_launch_M136","","","",[],[],""];
			_weap_at = ["launch_MRAWS_green_F","","","",["MRAWS_HEAT_F",1],[],""];
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

	_weap_cco = [_rifle,"",_lamp,_cco,[_mag,30],[],""];
	_weap_rco = [_rifle,"",_lamp,"optic_hamr",[_mag,30],[],""];
	_weap_s = [_rifle_s,"",_lamp,_cco,[_mag,30],[],""];
	_weap_ar = [_rifle_ar,"",_lamp,_cco,[_mag_ar,100],[],_bipod];
	_weap_mg = [_rifle_ar,"",_lamp,"optic_hamr",[_mag_ar,100],[],_bipod];
	_weap_m = [_rifle_m,"",_lamp,"optic_sos",[_mag,30],[],_bipod];
	_weap_gl = [_rifle_gl,"",_lamp,"optic_hamr",[_mag,30],["1Rnd_HE_Grenade_shell",1],""];
	_pistol = ["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""];

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
		_weap_s,
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		[_vest_2,[["HandGrenade",2,1],["SmokeShellGreen",4,1],[_mag,7,30],["16Rnd_9x21_Mag",2,17]]],
		[_backpack_small,[["ACRE_PRC117F",1],["SmokeShellPurple",2,1]]],
		"H_Beret_Colonel",
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
		[_vest_1,[["HandGrenade",2,1],["SmokeShell",2,1],["SmokeShellGreen",2,1],[_mag,7,30],["16Rnd_9x21_Mag",2,17]]],
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
		_weap_s,
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
		_weap_ar,
		[],
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_2,[["HandGrenade",2,1],["SmokeShell",2,1],[_mag_ar,3,100],["16Rnd_9x21_Mag",2,17]]],
		[_backpack_small,[[_mag_ar,4,100]]],
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
		[_vest_2,_itemsV_base],
		[_backpack_med,[[_mag_ar,8,100]]],
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
		[_vest_2,[["HandGrenade",2,1],["SmokeShell",2,1],[_mag_ar,3,100],["16Rnd_9x21_Mag",2,17]]],
		[_backpack_small,[[_mag_ar,4,100]]],
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
		[_vest_2,_itemsV_base],
		[_backpack_med,[[_mag_ar,6,100]]],
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
		_weap_s,
		_weap_at,
		_pistol,
		[_uniform,_itemsU_base],
		[_vest_2,_itemsV_base],
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
		[_vest_2,_itemsV_base],
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
		_weap_s,
		[],
		_pistol,
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
		_weap_m,
		[],
		_pistol,
		[_uniform,(_itemsU_base + [["optic_hamr",1],["ACE_Kestrel4500",1],["ACE_RangeCard",1]])],
		[_vest_1,_itemsV_base],
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
		[_vest_2,[["HandGrenade",2,1],["SmokeShell",2,1],[_mag,7,30],["1Rnd_HE_Grenade_shell",4,1],["16Rnd_9x21_Mag",2,17]]],
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
		[_vest_2,_itemsV_base],
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
		_weap_rco,
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
		_weap_s,
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		["V_TacVest_oli",[["HandGrenade",2,1],["SmokeShell",2,1],[_mag,5,30],["16Rnd_9x21_Mag",2,17]]],
		[],
		"H_HelmetCrew_B",
		_facewear,
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};

loadoutCC_PILOT = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_s,
		[],
		_pistol,
		[_uniform,_itemsU_tl],
		["V_TacVest_oli",[["HandGrenade",2,1],["SmokeShell",2,1],[_mag,5,30],["16Rnd_9x21_Mag",2,17]]],
		[],
		"H_PilotHelmetHeli_B",
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
		[_vest_2,[["ACE_Kestrel4500",1],["ACE_RangeCard",1],["ACE_ATragMX",1],["SmokeShell",2,1],["HandGrenade",2,1],["7Rnd_408_Mag",5,7],["11Rnd_45ACP_Mag",4,11]]],
		[_backpack_small,[["optic_nightstalker",1],["7Rnd_408_Mag",2,7]]],
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
		["arifle_SPAR_01_blk_F","muzzle_snds_m","acc_pointer_ir","optic_erco_blk_f",["30Rnd_556x45_Stanag_red",30],[],""],
		[],
		["hgun_Pistol_heavy_01_F","muzzle_snds_acp","acc_flashlight_pistol","",["11Rnd_45ACP_Mag",11],[],""],
		[_uniform,_itemsU_tl],
		[_vest_1,[["ACE_Kestrel4500",1],["ACE_ATragMX",1],["HandGrenade",2,1],["SmokeShell",2,1],["30Rnd_556x45_Stanag_red",7,30],["11Rnd_45ACP_Mag",2,11]]],
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
		_weap_s,
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
