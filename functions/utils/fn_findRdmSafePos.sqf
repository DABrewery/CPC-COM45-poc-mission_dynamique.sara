/* ----------------------------------------------------------------------------
Function: fn_findRdmSafePos.sqf

Description:
	Find a random position in a marker zone with safe position parameters :
	- at a minimum distance from the center of the marker position,
	- at a maximum distance from the center of the marker position,
	- at a minmimum distance from the nearest object,
	- the position is not in the blaclisted area   

Parameters:
	_markerZone - marker name (type ellipse or rectangle) in which the vehicle patrols [STRING]
	_posParams - parameters for waypoint position, see BIS_fnc_findSafePos [ARRAY, defaults to [10,500,10,0]]
	_blacklist - area where waypoint position can't be set - [ARRAY, defaults to nil]

Returns:
	position

Examples:
    (begin example)
	["marker_zone", [5,200,5,0], "water"] spawn fn_findRdmSafePos
   (end)

Author:
	tanin69
---------------------------------------------------------------------------- */

params [
	"_markerZone",
	["_posParams", [10,100,10,0],[[]],[4]],
	["_blacklist", [], [[], ""]]
];

//Find a random position inside zone marker, will be the center for BIS_fnc_findSafePos argument
private _centerPos = [[_markerZone], _blacklist] call BIS_fnc_randomPos;

//Find a safe position, almost flat terrain
private _randomPos = [
	_centerPos,
	_posParams#0,
	_posParams#1,
	_posParams#2,
	_posParams#3,
	0.2,
	nil,
	nil,
	[getMarkerPos _markerZone, [0,0,0]]
] call BIS_fnc_findSafePos;

//systemChat format ["_randomPos: %1", _randomPos];

_randomPos