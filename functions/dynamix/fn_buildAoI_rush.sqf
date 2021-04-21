/* Spawn units for a rush game style 

https://community.bistudio.com/wiki/BIS_fnc_findOverwatch


*/


params [
	"_AoI",
	"_AoIMrk",
	"_spawnPos"
];

if !(isServer) exitWith {};

//Get mission parameters
private _hostileForce = "HostileForce" call BIS_fnc_getParamValue;
private _hostileStrenght = "HostileStrenght" call BIS_fnc_getParamValue;
private _intelLevel = "Intel" call BIS_fnc_getParamValue;

//Difficulty level variables
private _probaHeavyWeapon = 0;
private _grpScout = [];
private _grpAssault = [];
private _nbPl = 0;

//Set difficulty level from mission parameter
switch (_hostileStrenght) do {
	case 1: {
		_probaHeavyWeapon = 0.3;
		_grpScout = SMALL_ENI_INF_GROUP;
		_grpAssault = MEDIUM_ENI_INF_GROUP;
		_nbPl = [5];
	};
	case 2: {
		_probaHeavyWeapon = 0.6;
		_grpScout = SMALL_ENI_INF_GROUP;
		_grpAssault = MEDIUM_ENI_INF_GROUP;
		_nbPl = [10,11,12,13,14,15];
	};
	case 3: {
		_probaHeavyWeapon = 1;
		_grpScout = SMALL_ENI_INF_GROUP;
		_grpAssault = LARGE_ENI_INF_GROUP;
		_nbPl = [7,8,9];
	};
};

//Define objectives
private _mrkObjectives = "mrkCtrl" + _AoI;
_tbObjectives = allMapMarkers select {[_mrkObjectives, _x, true] call BIS_fnc_inString};


/* TODO
2 AI mindsets :
- careful : send scout units before sending assault waves
- brute : send constant waves until troup exhaustion
*/

//Spawn scout groups
for "_i" from 0 to ((count _tbObjectives) - 1) do {
	private _grp = [getMarkerPos (selectRandom _spawnPos), opfor, selectRandom _grpScout] call GDC_fnc_lucySpawnGroupInf;
	_waypoint = [
		_grp,
		getMarkerPos (_tbObjectives#_i),
		0,
		"SAD",
		"NORMAL",
		"AWARE",
		"RED",
		"RANDOM"
	] call GDC_fnc_lucyAddWaypoint;
};

sleep 30 + random 30;

//Assault wave
for "_i" from 0 to ((count _tbObjectives) - 1) do {
	private _grp = [getMarkerPos (selectRandom _spawnPos), opfor, selectRandom _grpAssault] call GDC_fnc_lucySpawnGroupInf;
	_waypoint = [
		_grp,
		getMarkerPos (_tbObjectives#_i),
		0,
		"SAD",
		"NORMAL",
		"AWARE",
		"RED",
		"RANDOM"
	] call GDC_fnc_lucyAddWaypoint;
};

