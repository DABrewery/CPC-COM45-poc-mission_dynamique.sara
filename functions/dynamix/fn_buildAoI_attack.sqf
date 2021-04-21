/*
	
	Sets an hostile zone that players will attack :
	- spawn buildings (compositions)
	- spawn units
	- Launch reinforcement script

	TODO: generate spawn markers by script (https://community.bistudio.com/wiki/selectBestPlaces, https://community.bistudio.com/wiki/BIS_fnc_findSafePos, https://community.bistudio.com/wiki/isFlatEmpty)
	(like vehicle patrols spawn)
*/

params [
	"_AoI",
	"_AoIMrk"
];

if !(isServer) exitWith {};

/***********************************
	Mission parameters
************************************/

//Get mission parameters
	private _hostileForce = "HostileForce" call BIS_fnc_getParamValue;
	private _hostileStrenght = "HostileStrenght" call BIS_fnc_getParamValue;
	private _intelLevel = "Intel" call BIS_fnc_getParamValue;


/***********************************
	Hostile groups compo,
	from mission parameters
************************************/

//Hostile set variables
	private _grpGn = [];
	private _grpPl = [];
	private _nbPl = [];
	private	_car =  CAR_ENI_1;
	private _nbVehPatrols = 0;
	private _probaFixedWeapon = 0;
	private _probaHeavyWeapon = 0;
	private _probaIFV = 0;
	private _probaMBT = 0;
	private _fixedWeapon = [HMG, HMG_GUNNER];
	private _heavyWeapon = [];
	private _ifv = IFV_1;
	private _ifvCrew = IFV_1_CREW;
	private _mbt = MBT;
	private _mbtCrew = MBT_CREW;
	
/***********************************
	Set hostile spawn parameters
************************************/

switch (_hostileForce) do {
	case 1: {
		switch (_hostileStrenght) do {
			case 1: {
				_grpGn = MEDIUM_ENI_INF_GROUP;
				_grpPl = SMALL_ENI_INF_GROUP;
				_nbPl = [5];
				_nbVehPatrols = 1;
				_probaFixedWeapon = 0.3;
				_probaHeavyWeapon = 0.2;
				_heavyWeapon = [HMG, HMG_GUNNER];
				_probaIFV = 0.05;
			};
			case 2: {		
				_grpGn = MEDIUM_ENI_INF_GROUP;
				_grpPl = SMALL_ENI_INF_GROUP;
				_nbPl = [10,11,12,13,14,15];
				_nbVehPatrols = 2;
				_probaFixedWeapon = 0.6;
				_probaHeavyWeapon = 0.6;
				_heavyWeapon = [HMG, HMG_GUNNER];
				_probaIFV = 0.1;
			};
			case 3: {				
				_grpGn = LARGE_ENI_INF_GROUP;
				_grpPl = MEDIUM_ENI_INF_GROUP;
				_nbPl = [7,8,9];
				_nbVehPatrols = selectRandom [3,4];
				_probaFixedWeapon = 1;
				_probaHeavyWeapon = 0.6;
				_heavyWeapon = [HMG, HMG_GUNNER];
				_probaIFV = 0.15;
			};
		};
	};
	case 2: { //mainly armored
		switch (_hostileStrenght) do {
			case 1: {
				_grpGn = MEDIUM_ENI_INF_GROUP;
				_grpPl = SMALL_ENI_INF_GROUP;
				_nbPl = [2];
				_nbVehPatrols = 2;
				_probaFixedWeapon = 0.3;
				_probaHeavyWeapon = 0.2;
				_heavyWeapon = [AT, AT_GUNNER];
				_probaIFV = 0.1;
				_probaMBT = 0.05;
			};
			case 2: {		
				_grpGn = MEDIUM_ENI_INF_GROUP;
				_grpPl = SMALL_ENI_INF_GROUP;
				_nbPl = [5,6];
				_nbVehPatrols = 3;
				_probaFixedWeapon = 0.6;
				_probaHeavyWeapon = 0.5;
				_heavyWeapon = [AT, AT_GUNNER];
				_probaIFV = 0.2;
				_probaMBT = 0.1;
			};
			case 3: {				
				_grpGn = MEDIUM_ENI_INF_GROUP;
				_grpPl = MEDIUM_ENI_INF_GROUP;
				_nbPl = [7,8,9];
				_nbVehPatrols = 4;
				_probaFixedWeapon = 1;
				_probaHeavyWeapon = 0.7;
				_heavyWeapon = [AT, AT_GUNNER];
				_probaIFV = 0.3;
				_probaMBT = 0.2;
			};
		};
	};
	case 3: { //combined arms : TODO
	};
};


/************************************
	Spawn compositions and intel 
	markers
************************************/

//Compositions variables
	private _mainFOB = "FOB_Medium";
	private _fortifPos_HW = "Camo_Pos_1";
	private _fortifPos_FW = "AA_ZU_Simple";

//if AoI is not built (defined in AoI config file), spawn a FOB near center of the AoI
private _compReference = "";
if (getNumber (missionConfigFile >> "areasOfInterest" >> _AoI >> "isEmpty") == 1) then {
	_spawnPos = [getMarkerPos _AoIMrk, 1, 20, 3, 0, 5] call BIS_fnc_findSafePos;
	_compReference = [_mainFOB, [_spawnPos#0,_spawnPos#1,0]] call LARs_fnc_spawnComp;
	//_posComp = [_compReference] call LARs_spawnComp_fnc_getCompPosition;
	[[_spawnPos#0,_spawnPos#1], 100] call dax_fnc_hideObjects;
};

//Add a visible marker on HQ position if 'Intel' mission parameter allows it
private _HQPos = [];
if (_intelLevel < 3) then {
	if !(_compReference == "") then {
		_HQPos = getPos (([_compReference] call LARS_fnc_getCompObjects)#0);
	} else {
		_HQPos = getMarkerPos _AoIMrk;
	};
	[_HQPos, "marker_HQ_", "o_hq", "colorRed", "HQ ENI"] call dax_fnc_createMarker;
};


/************************************
	Spawn hostile units
************************************/

//Arrays for spawn positions
	private _tbHeavyWeapons = [];
	private _tbFixedWeapons = [];
	private _tbIFV = [];
	private _tbMBT = [];

//Prepare spawn markers for heavy weapons and fortified positions spawn
private _mrkFP = "mrkFP" + _AoI;
private _tbMrkFP = allMapMarkers select {[_mrkFP, _x, true] call BIS_fnc_inString};
{
	//Fill array for spawn position
	if (random 1 < _probaHeavyWeapon) then {
		_tbHeavyWeapons pushBack _x;
		//Add a visible marker on fortified position if 'Intel' mission parameter allow it
		if (_intelLevel < 2) then {
			[getMarkerPos _x, "marker_fortif_","loc_Bunker", "colorRed"] call dax_fnc_createMarker;
		};
	};	
} forEach _tbMrkFP;


//Prepare spawn markers for fixed weapons and fortified positions spawn
private _mrkFW = "mrkFW" + _AoI;
private _tbMrkFW = allMapMarkers select {[_mrkFW, _x, true] call BIS_fnc_inString};
{
	if (random 1 < _probaFixedWeapon) then {
		_tbFixedWeapons pushBack _x;
		//Add a visible a marker on fortified position if 'Intel' mission parameter allow it
		if (_IntelLevel < 2) then {
			[getMarkerPos _x, "marker_fortif_", "loc_Bunker", "colorRed"] call dax_fnc_createMarker;
		};
	};
} forEach _tbMrkFW;

//Prepare spawn markers for IFV
private _mrkIFV = "mrkIFV" + _AoI;
private _tbMrkIFV = allMapMarkers select {[_mrkIFV, _x, true] call BIS_fnc_inString};
{
	if (random 1 < _probaIFV) then {
		_tbIFV pushBack _x;
	};
} forEach _tbMrkIFV;

//Prepare spawn markers for MBT
private _mrkMBT = "mrkMBT" + _AoI;
private _tbMrkMBT = allMapMarkers select {[_mrkMBT, _x, true] call BIS_fnc_inString};
{
	if (random 1 < _probaMBT) then {
		_tbMBT pushBack _x;
	};
} forEach _tbMrkMBT;

//Spawn garrison groups
if (count _grpGn > 0) then {
	private _mrkGn = "mrkGn" + _AoI;
	private _tbMrkGn = allMapMarkers select {[_mrkGn, _x, true] call BIS_fnc_inString};
	[_tbMrkGn, _grpGn, opfor, nil, nil, 0.1, 1] spawn dax_fnc_spawnGarrisons;
};

//Spawn infantery patrols
if (count _grpPl > 0) then {
	private _mrkPl = "mrkPl" + _AoI;
	private _patrolZone = "marker_zone";
	private _tbMrkPl = allMapMarkers select {[_mrkPl, _x, true] call BIS_fnc_inString};
	[_tbMrkPl, _patrolZone, _nbPl, _grpPl, opfor] spawn dax_fnc_spawnRdmPatrols;
};

//Spawn fixed weapons
if (_probaFixedWeapon > 0) then {
	//private _mrkFW = "mrkFW" + _AoI;
	[_tbFixedWeapons, nil, nil, _fixedWeapon#0, _fixedWeapon#1, 1, 1, 1] call dax_fnc_spawnFixedWeapons;
	//Spawn composition
	{_compReference = [_fortifPos_FW, getMarkerPos _x, nil, markerDir _x] call LARs_fnc_spawnComp;} forEach _tbFixedWeapons;
};

//Spawn heavy weapons
if (_probaHeavyWeapon > 0) then {
	//private _mrkFP = "mrkFP" + _AoI;
	[_tbHeavyWeapons, [0,0,0], nil, _heavyWeapon#0, _heavyWeapon#1, 1, 1, 0] call dax_fnc_spawnFixedWeapons;
	//Spawn compositions
	{_compReference = [_fortifPos_HW, getMarkerPos _x, nil, markerDir _x] call LARs_fnc_spawnComp;} forEach _tbHeavyWeapons;
};

//Spawn IFV (fixed)
if (_probaIFV > 0) then {
	[_tbIFV, [0,0,0], nil, selectRandom _ifv, _ifvCrew, 1, 1, 0] call dax_fnc_spawnFixedWeapons;
};

//Spawn MBT (fixed)
if (_probaMBT > 0) then {
	[_tbMBT, [0,0,0], nil, selectRandom _mbt, _mbtCrew, 1, 1, 0] call dax_fnc_spawnFixedWeapons;
};

//Spawn vehicle patrols
for "_i" from 1 to _nbVehPatrols do {
	private _vehPl = "";
	//If hostile forces are mainly infantry, don't spawn IFV
	if (_hostileForce == 1) then {
		_vehPl = selectRandom _car;
	} else {
		_vehPl = selectRandom (_car + _ifv);
	};
	//Automatically find spawn positions : inside "marker_zone" marker, on a approximatly flat terrain, outside AoI marker, not on water
	private _spawnPos = ["marker_zone", nil, [_AoIMrk]] call dax_fnc_findRdmSafePos;
	//Spawn vehicle
	private _tbVeh = [_spawnPos, 0, _vehPl, opfor] call BIS_fnc_spawnVehicle;
	//Make it patrol
	[_tbVeh#2, "marker_zone", nil, nil, ["water", _AoIMrk]] call dax_fnc_lucyVehicleRandomPatrol;
};

/* Build and spawn are finished : launch reinforcement script */

private _reinfLvl = "Reinforcements" call BIS_fnc_getParamValue;
if (_reinfLvl > 1) then {
	[_AoI, _AoIMrk] spawn dax_fnc_spawnReinforcements;
};

