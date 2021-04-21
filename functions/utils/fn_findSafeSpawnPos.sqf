/* find a spawn position for vehicle */		

params [
	"_refPosition",
	["_locationType", ["nameVillage", "nameCity", "nameCityCapital"]],
	["_minDistFromPlayer", 1000]
];
		
		
//private _cityLocations = ["nameCity", "nameCityCapital"]; 
//private _fromPos = getMarkerPos _AoIMrk;
//private _minDist = 1000;
private _reinfSpawnPos = [0,0];
private _nearestPlayer = [];

{ 
	_nearestPlayer = [locationPosition _x] call GDC_fnc_lucyGetNearestPlayer;
	if ((_nearestPlayer#1) > 1000) exitWith {_reinfSpawnPos = locationPosition _x};
} forEach nearestLocations [_refPosition, _locationType, 6000, _refPosition];
//Find a road position where to spawn vehicle(s) -> careful ! Won't work on map with no road at all
private _nearRoads = [_reinfSpawnPos#0, _reinfSpawnPos#1] nearRoads 300;
private _road = _nearRoads#0;
{
	_roadPos = position (_x);
	_isEmpty = !(_roadPos isFlatEmpty  [10, -1, -1, -1, -1, false, player] isEqualTo []);
	if (_isEmpty) exitWith {_reinfSpawnPos = _roadPos; _road = _x};
} forEach _nearRoads;
_reinfSpawnPos = position (_nearRoads#0);
private _info = getRoadInfo (_nearRoads#0);
private _dir = (_info select 6) getDir (_info select 7);

[_reinfSpawnPos, _dir]