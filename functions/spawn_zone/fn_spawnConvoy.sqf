/* ----------------------------------------------------------------------------
Function: fn_spawnGarrisons

Description:
	Spawns a convoy of vehicles and send it at destination.	
	The convoy will drive on "SAFE" behaviour mode (will take roads), but will
	jump in "COMBAT" behaviour mode as soon as "firedNear" event is fired. Must be
	executed in scheduled environment.

Parameters:
	_spawnPos - spawn position [Position]
	_firstVehicle - vehicle class name [STRING]
	_otherVehicles - array of vehicle class names [ARRAY]
	_destinationPos - destination position [Position]
	
Returns:
	Nothing

Examples:
    (begin example)
	[getMarkerPos "mkr_spawnConvoy", "B_T_LSV_01_armed_F", ["B_T_MRAP_01_hmg_F", "B_T_MRAP_01_gmg_F"], getMarkerpos "mkr_convoyDestination"] call fn_spawnGarrisons;
    (end)

Author:
	tanin69
---------------------------------------------------------------------------- */


params [
	["_spawnPos",[]],
	["_firstVehicle",""],
	["_otherVehicles",[],[[]]],
	"_destinationPos"
];

// Spawn the first vehicle and set convoy params
private _leadVeh = _firstVehicle createVehicle _spawnPos; 
createVehicleCrew _leadVeh;
_leadVeh setConvoySeparation 50; 
_leadVehGrp = group driver _leadVeh;

_leadVeh addEventHandler ["FiredNear", {
	params ["_unit"];
	(group _unit) setBehaviour "COMBAT";
	(group _unit) setFormation "LINE";
}];

// Spawn the other vehicles
{
	sleep 5;
	private _otherVeh = _x createVehicle _spawnPos;
	createVehicleCrew _otherVeh;
	_otherVeh setConvoySeparation 50;
	private _crew = crew _otherVeh;
	// Join the leading group
	_crew join _leadVehGrp;

} forEach _otherVehicles;

// Set the group behavior.
_leadVehGrp setBehaviour "SAFE";
_leadVehGrp setFormation "COLUMN";

// Convoy movement, gets on SAD behavior at the end of the movement
_waypoint = _leadVehGrp addWaypoint [_destinationPos, 0]; 
_waypoint setWaypointType "Move";
_waypoint setWaypointStatements ["true","(group this) setBehaviour 'SAD';(group this) setFormation 'LINE'"];