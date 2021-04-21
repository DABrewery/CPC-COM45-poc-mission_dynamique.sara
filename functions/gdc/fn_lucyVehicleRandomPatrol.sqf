/* ----------------------------------------------------------------------------
Function: fn_lucyVehicleRandomPatrol.sqf

Description:
	Create an infinite random patrol for a vehicle in an area.

	Add recursive waypoint to a vehicle group, with following caracteristics for the waypoint: 
	- the waypoint is in a marker area,
	- at a minimum distance from the center of the marker position,
	- at a maximum distance from the center of the marker position,
	- at a minmimum distance from the nearest object,
	- with type of marker, group/waypoint speed, group/waypoint behaviour, group/waypoint combat mode, group/waypoint formation,
	- the marker is not in the blaclisted area   

Parameters:
	_group - group that follows random waypoints [OBJECT group]
	_markerZone - marker name (type ellipse or rectangle) in which the vehicle patrols [STRING]
	_wpPosParams - parameters for waypoint position, see BIS_fnc_findSafePos [ARRAY, defaults to [10,500,10,0]]
	_wpParams - parameters for waypoint, see https://community.bistudio.com/wiki/Category:Command_Group:_Waypoints [ARRAY, defaults to ["MOVE", "LIMITED", "SAFE", "RED", "COLUMN"]]
	_blacklist - area where waypoint position can't be set - [ARRAY, defaults to nil]

Returns:
	Nothing

Examples:
    (begin example)
	[_grp, "mrkPatrolArea", [5,200,5,0], ["MOVE", "LIMITED", "SAFE", "RED", "COLUMN"], "water"] spawn fn_lucyVehicleRandomPatrol
   (end)

Author:
	tanin69 (not published in gdc repo)
---------------------------------------------------------------------------- */

params [
	"_group",
	"_markerZone",
	["_wpPosParams", [10,100,10,0],[[]],[4]],
	["_wpParams", ["MOVE", "LIMITED", "SAFE", "RED", "COLUMN"],[[]], [5]],
	["_blacklist", [], [[], ""]]
];


_randomPos = [_markerZone, _wpPosParams, _blacklist] call dax_fnc_findRdmSafePos;

// Statement will recall the function when waypoint is reached
_wp = 
[
    _group, 
    _randomPos, 
    5, 
    _wpParams#0,
    _wpParams#1,
    _wpParams#2,
    _wpParams#3,
    _wpParams#4,
    15, 
    [0,0,0], 
	["true", format["nul = [this] spawn {[group (_this select 0), %1, %2, [%3,""UNCHANGED"",""UNCHANGED"",""NO CHANGE"",""NO CHANGE""], %4] call dax_fnc_lucyVehicleRandomPatrol;};", str _markerZone, str _wpPosParams, str(_wpParams #0), str _blackList]]
] call GDC_fnc_lucyAddWaypoint;
