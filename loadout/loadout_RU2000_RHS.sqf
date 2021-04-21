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
	_helmet = "";
	_vest_r = "";
	_vest_tl = "";
	_vest_gl = "";
	_vest_c = "";
	_vest_mg = "";
	_vest_doc = "";
	_vest_m = "";
	_nvg = "";
	_lamp = "";
	_weap_lat = [];
	_weap_at = [];
	_mun_at = [];

	switch (dax_p_nvg) do {
		case 0: {_nvg = ""; _lamp = "";};
		case 1: {_nvg = "rhs_1PN138"; _lamp = "rhs_acc_2dpzenit";};
		case 2: {_nvg = ""; _lamp = "rhs_acc_2dpzenit";};
		default {_nvg = ""; _lamp = "";};
	};
	
	switch (dax_loadoutcamo) do {
		case "jungle";
		case "winter";
		case "woodland": {
			_uniform = "rhs_uniform_flora_patchless";
			_helmet = selectRandom ["rhs_6b27m_green","rhs_6b27m_green_bala","rhs_6b27m_green_ess","rhs_6b27m_green_ess_bala","rhs_6b27m","rhs_6b27m_bala","rhs_6b27m_ess","rhs_6b27m_ess_bala"];
			_vest_r = "rhs_6b23_6sh92";
			_vest_tl = "rhs_6b23_6sh92_radio";
			_vest_gl = "rhs_6b23_6sh92_vog";
			_vest_c = "rhs_6b23_crew";
			_vest_mg = "rhs_6b23_engineer";
			_vest_doc = "rhs_6b23_medic";
			_vest_m = "rhs_6b23_sniper";
		};
		case "desert";
		case "polyvalent";
		default {
			_uniform = "rhs_uniform_mflora_patchless";
			_helmet = selectRandom ["rhs_6b27m_green","rhs_6b27m_green_bala","rhs_6b27m_green_ess","rhs_6b27m_green_ess_bala","rhs_6b27m_ml","rhs_6b27m_ml_bala","rhs_6b27m_ml_ess","rhs_6b27m_ML_ess_bala"];
			_vest_r = "rhs_6b23_ML_6sh92";
			_vest_tl = "rhs_6b23_ML_6sh92_radio";
			_vest_gl = "rhs_6b23_ML_6sh92_vog";
			_vest_c = "rhs_6b23_ML_crew";
			_vest_mg = "rhs_6b23_ML_engineer";
			_vest_doc = "rhs_6b23_ML_medic";
			_vest_m = "rhs_6b23_ML_sniper";
		};
	};
	switch (cc_rhsennemy) do {
		case false: {
			_weap_lat = ["CUP_launch_RPG18","","","",[],[],""];
			_weap_at = ["CUP_launch_RPG7V","","","cup_optic_pgo7v3",["CUP_PG7VM_M",1],[],""];
			_mun_at = ["CUP_B_RPGPack_Khaki",[["CUP_PG7VM_M",2,1],["CUP_OG7_M",2,1]]];
		};
		case true;
		default {
			_weap_lat = ["rhs_weap_rpg26","","","",[],[],""];
			_weap_at = ["rhs_weap_rpg7","","","rhs_acc_pgo7v3",["rhs_rpg7_PG7VL_mag",1],[],""];
			_mun_at = ["rhs_rpg_empty",[["rhs_rpg7_PG7VL_mag",2,1],["rhs_rpg7_TBG7V_mag",1,1]]];
		};
	
	};

	_backpack1 = "rhs_sidor";
	_backpack2 = "rhs_assault_umbts";
	_weap = ["rhs_weap_ak74m","rhs_acc_dtk",_lamp,"",["rhs_30Rnd_545x39_7N10_AK",30],[],""];

	_itemsU_base = [["ACE_fieldDressing",4],["ACE_tourniquet",1],["ACE_EarPlugs",1],["ACE_Flashlight_KSF1",1],["ACRE_PRC343",1],["ACE_CableTie",1]];
	_itemsU_tl = _itemsU_base + [["ACRE_PRC148",1],["ACE_microDAGR",1],["ACE_MapTools",1]];
	_itemsV_base = [["rhs_mag_rgd5",2,1],["rhs_mag_rdg2_white",2,1],["rhs_30Rnd_545x39_7N10_AK",7,30]];
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
		[],
		[_uniform,_itemsU_tl],
		[_vest_tl,_itemsV_base],
		[_backpack2,[["ACRE_PRC117F",1],["SmokeShellPurple",2,1]]],
		_helmet,
		"",
		["rhs_pdu4","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};


loadoutCC_TL = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap,
		_weap_lat,
		[],
		[_uniform,_itemsU_tl],
		[_vest_tl,_itemsV_base],
		[],
		_helmet,
		"",
		["rhs_pdu4","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
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
		[_backpack2,_itemsB_medic],
		_helmet,
		"",
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};

loadoutCC_AR = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_pkm","","","",["rhs_100Rnd_762x54mmR_green",100],[],""],
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest_mg,[["rhs_mag_rdg2_white",1,1],["rhs_100Rnd_762x54mmR_green",1,100]]],
		[_backpack1,[["rhs_100Rnd_762x54mmR_green",2,100]]],
		_helmet,
		"",
		[],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
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
		[_backpack1,[["rhs_100Rnd_762x54mmR_green",2,100]]],
		_helmet,
		"",
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
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
		[_vest_mg,[["rhs_mag_rdg2_white",1,1],["rhs_100Rnd_762x54mmR_green",1,100]]],
		[_backpack1,[["rhs_100Rnd_762x54mmR_green",2,100]]],
		_helmet,
		"",
		[],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
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
		[_backpack1,[["rhs_100Rnd_762x54mmR_green",2,100]]],
		_helmet,
		"",
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
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
		[_vest_r,_itemsV_base],
		_mun_at,
		_helmet,
		"",
		[],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
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
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
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
		[_vest_r,_itemsV_base],
		[_backpack2,[["ACE_M26_Clacker",1],["ACE_DefusalKit",1],["ACE_EntrenchingTool",1],["SatchelCharge_Remote_Mag",1,1],["DemoCharge_Remote_Mag",2,1]]],
		_helmet,
		"",
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};

loadoutCC_M = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_svdp_wd","","","rhs_acc_pso1m2",["rhs_10Rnd_762x54mmR_7N14",10],[],""],
		[],
		[],
		[_uniform,(_itemsU_base + [["rhs_acc_1pn93_1",1]])],
		[_vest_m,[["rhs_mag_rgd5",2,1],["rhs_mag_rdg2_white",1,1],["rhs_10Rnd_762x54mmR_7N14",9,10]]],
		[],
		_helmet,
		"",
		[],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};

loadoutCC_GL = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_ak74m_gp25","rhs_acc_dtk","","",["rhs_30Rnd_545x39_7N10_AK",30],["rhs_VOG25",1],""],
		[],
		[],
		[_uniform,(_itemsU_base + [["rhs_mag_rgd5",1,1],["rhs_mag_rdg2_white",1,1]])],
		[_vest_gl,[["rhs_mag_rgd5",2,1],["rhs_30Rnd_545x39_7N10_AK",5,30],["rhs_VOG25",9,1],["rhs_GDM40",4,1],["rhs_VG40OP_green",1,1]]],
		[],
		_helmet,
		"",
		[],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
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
		[_backpack1,[["rhs_30Rnd_545x39_7N10_AK",8,30],["rhs_mag_rdg2_white",2,1],["rhs_mag_rgd5",2,1],["ACE_HandFlare_Green",4,1]]],
		_helmet,
		"",
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
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
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
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
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};

loadoutCC_CREW = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_aks74u","rhs_acc_pgs64_74u","","",["rhs_30Rnd_545x39_7N6M_AK",30],[],""],
		[],
		[],
		[_uniform,_itemsU_tl],
		[_vest_c,[["rhs_mag_rgd5",2,1],["rhs_mag_rdg2_white",2,1],["rhs_30Rnd_545x39_7N6M_AK",5,30]]],
		[],
		(selectrandom ["rhs_tsh4","rhs_tsh4_bala"]),
		"",
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};

loadoutCC_PILOT = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_aks74u","rhs_acc_pgs64_74u","","",["rhs_30Rnd_545x39_7N6M_AK",30],[],""],
		[],
		[],
		["rhs_uniform_df15",_itemsU_tl],
		["rhs_6sh92_radio",[["rhs_mag_rgd5",2,1],["rhs_mag_rdg2_white",1,1],["rhs_30Rnd_545x39_7N6M_AK",5,30]]],
		[],
		"rhs_zsh7a_mike",
		"",
		[],
		["ItemMap","","","ItemCompass","ACE_Altimeter",(if (dax_p_nvg > 0) then {"rhsusf_ANPVS_15"} else {""})]
	];
};

loadoutCC_SNIPER = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_svdp_wd","rhs_acc_tgpv","","rhs_acc_pso1m2",["rhs_10Rnd_762x54mmR_7N14",10],[],""],
		[],
		["rhs_weap_pb_6p9","rhs_acc_6p9_suppressor","","",["rhs_mag_9x18_8_57N181S",8],[],""],
		[_uniform,_itemsU_tl],
		["rhs_6sh92_radio",[["ACE_Kestrel4500",1],["ACE_RangeCard",1],["ACE_ATragMX",1],["rhs_mag_rdg2_white",2,1],["rhs_mag_rgd5",2,1],["rhs_10Rnd_762x54mmR_7N14",5,10],["rhs_mag_9x18_8_57N181S",5,8]]],
		[_backpack2,[["rhs_10Rnd_762x54mmR_7N14",5,10],["rhs_acc_1pn93_1",1]]],
		"rhs_Booniehat_flora",
		"rhs_scarf",
		["rhs_pdu4","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",(if (dax_p_nvg > 0) then {"CUP_NVG_HMNVS"} else {""})]
	];
};

loadoutCC_OBS = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_ak105","rhs_acc_dtk4short",_lamp,"rhs_acc_ekp1",["rhs_30Rnd_545x39_7N10_AK",30],[],""],
		[],
		["rhs_weap_pb_6p9","rhs_acc_6p9_suppressor","","",["rhs_mag_9x18_8_57N181S",8],[],""],
		[_uniform,_itemsU_tl],
		["rhs_6sh92_radio",[["ACE_Kestrel4500",1],["ACE_ATragMX",1],["rhs_mag_rgd5",2,1],["rhs_mag_rdg2_white",2,1],["rhs_30Rnd_545x39_7N10_AK",5,30],["rhs_mag_9x18_8_57N181S",2,8]]],
		[_backpack2,[["rhs_30Rnd_545x39_7N10_AK",4,30],["rhs_mag_rgd5",2,1],["rhs_mag_rdg2_white",2,1]]],
		"rhs_Booniehat_flora",
		"rhs_scarf",
		["rhs_pdu4","","","",[],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",(if (dax_p_nvg > 0) then {"CUP_NVG_HMNVS"} else {""})]
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
		[_vest_tl,[["rhs_mag_rgd5",2,1],["rhs_mag_rdg2_white",2,1],["rhs_30Rnd_545x39_7N10_AK",7,30]]],
		[_backpack2,[["ACRE_PRC117F",1],["SmokeShellGreen",4,1],["ACE_HandFlare_Green",1,1]]],
		_helmet,
		"",
		["Laserdesignator_01_khk_F","","","",["Laserbatteries",1],[],""],
		["ItemMap","","","ItemCompass","ACE_Altimeter",_nvg]
	];
};
