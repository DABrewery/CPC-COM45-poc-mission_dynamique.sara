//Common variables init
[] call dax_fnc_initCommonVariables;

waitUntil {!isnil "dax_variables_defined"};

//Hide spawn_zone markers
private _tbMrk = allMapMarkers select {["mrk", _x, true] call BIS_fnc_inString};
{_x setMarkerAlpha 0.0} forEach _tbMrk;

//ENI groups definition
[] call dax_fnc_initHostileUnits;

//Initialize PLUTO
[
	opfor,		        //0 camp
	[500,1000,6000],	//1 revealRange [man,land,air]
	[1500,2000,3000],	//2 sensorRange [man,land,air]
	120,			    //3 QRFtimeout
	[1000,2000,6000],	//4 QRFrange [man,land,air]
	[60,90,120],		//5 QRFdelay [min,mid,max]
	240,			    //6 ARTYtimeout
	[20,30,60],		    //7 ARTYdelay [min,mid,max]
	[1,2,4],		    //8 ARTYrounds [min,mid,max]
	[0,40,100]		    //9 ARTYerror [min,mid,max]
] call GDC_fnc_pluto;

gdc_plutoDebug = false;

//Initialize LUCY
[0.5,"mkr_spawn_static_unit",true,600.0,false,3600.0,true,true,"COLONEL"] call GDC_fnc_lucyInit;


private _AoIsPath = [];
private _AoI = "";
private _spawnBlackList = [];
private _spawnWhiteList = [];

//Launch game type from mission parameter
switch dax_p_gameStyle do {
	//Attack Game Style 
	case 1: {
		_AoIsPath = "getNumber (_x >> 'isAttackAoI') == 1" configClasses (missionConfigFile >> "areasOfInterest");
		_AoI = [_AoIsPath] call dax_fnc_selectAoI;
		[_AoI#0, _AoI#1] spawn dax_fnc_buildAoI_attack;
		//Define player spawn options
		_spawnBlackList = ["marker_zone"];
	};
	
	//Defence Game Style -> not implented
	case 2: {
		_AoIsPath = "getNumber (_x >> 'isDefenceAoI') == 1" configClasses (missionConfigFile >> "areasOfInterest");
	};
	
	//Rush Game Style  -> not implented
	case 3: {
		_AoIsPath = "getNumber (_x >> 'isRushAoI') == 1" configClasses (missionConfigFile >> "areasOfInterest");
		_AoI = [_AoIsPath] call dax_fnc_selectAoI;
		private _tbSpawnPos = allMapMarkers select {["mrkSpawnPos" + _AoI#0, _x, true] call BIS_fnc_inString};
		_spawnWhiteList pushBack (selectRandom _tbSpawnPos);
		private _mrkZnSpawn = _spawnWhiteList#0;
		"marker_spawn" setMarkerPos getMarkerPos _mrkZnSpawn;
		_mrkZnSpawn setMarkerAlpha 1;
		private _hostileSpawnPos = _tbSpawnPos - [_mrkZnSpawn];
		[_AoI#0, _AoI#1, _hostileSpawnPos] spawn dax_fnc_buildAoI_rush;	
	};
	
	//Ambush game style	-> not implented
	case 4: {
	
	};
};

//Give access to the garage if mission parameter allow it
if (dax_p_vehicle > 0) then {[] spawn dax_fnc_vehicleCreator};

//Player chosen spawn, with black list or white list depending on game style
["marker_spawn", nil, "SERGEANT", _spawnBlackList, 0, 5, 1, _spawnWhiteList] call dax_fnc_chooseSpawnPos;
