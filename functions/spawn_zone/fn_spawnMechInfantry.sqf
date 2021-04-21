/*


Another quick and (not so) dirty function to spawn mechanized infantry
Place 3 markers in Eden (parameter 0 of the function): 
- First one : spawn point of mechanized group
- Second one : area marker in which the infantry group is unloaded. The function look for an area clear of ennemies
- Third one : destination WP : group leader is ordered to seek and destroy in the area (SAD Wp type)

Parameters :
0: ARRAY : [mrkName, mrkName, mrkName]. Cf. supra
1: SIDE : side of the mechanized group (optionnal, default opfor)
2: ARRAY : infantry group, classname array (optionnal)
3: STRING : vehicle classname (optionnal)
4: NUMBER : vehicle heading at spawn point


*/

params [
	["_tbWP",[]],
	["_side",opfor],
	["_grpInfMeca",["rhs_vmf_flora_junior_sergeant","rhs_vmf_flora_machinegunner","rhs_vmf_flora_machinegunner_assistant","rhs_vmf_flora_LAT"]],
	["_clsVeh", "rhs_btr80_vdv"],
	["_vehHeading",0]
];

/* Test only
_tbWP = [getMarkerpos "mrkSpMeca_1",getMarkerpos "mrkWpMeca_1_1", getMarkerpos "mrkWpMeca_1_2"];
_side = opfor;
_grpInfMeca = ["rhs_vmf_flora_junior_sergeant","rhs_vmf_flora_machinegunner","rhs_vmf_flora_machinegunner_assistant","rhs_vmf_flora_LAT"];
_clsVeh = "rhs_btr80_vdv";
_vehHeading = 230;
*/

private _tbVeh = [];
//On spawn le groupe d'infanterie, le véhicule et son équipage, puis on charge le groupe d'infanterie dans le véhicule 
_grpInf = [[0,0,0], _side, _grpInfMeca] call GDC_fnc_lucySpawnGroupInf; 
if (typename (_tbWP#0) == "STRING") then {
	_tbVeh = [getMarkerpos (_tbWP#0), _vehHeading, _clsVeh, _grpInf] call BIS_fnc_spawnVehicle; 
} else {
	_tbVeh = [_tbWP#0, _vehHeading, _clsVeh, _grpInf] call BIS_fnc_spawnVehicle;
};
sleep 5;
{_x moveInCargo (_tbVeh#0)} forEach units _grpInf; 
sleep 5;

_wpUnload = _grpInf addWaypoint [_tbWP#1, -1];
_wpUnload setWaypointBehaviour "CARELESS";
_wpUnload setWaypointType "UNLOAD";
_wpUnload setWaypointStatements ["true","[(group this)] spawn {params['_grp'];while {true} do {assignedVehicle leader _grp doFollow leader _grp;_grp setVariable ['PLUTO_ORDER','QRF'];sleep 20;}}"];

//On envoie le groupe méca sur le dernier WP
_wpDest = _grpInf addWaypoint [_tbWP#2, -1];
_wpDest setWaypointBehaviour "AWARE";
_wpDest setWaypointType "SAD";

(_tbVeh#0) addEventHandler ["FiredNear", {
	params ["_unit"];
	private _group = group _unit;
	_group setBehaviour "COMBAT";
	for "_i" from count waypoints _group - 1 to 0 step -1 do
	{
		deleteWaypoint [_group, _i];
	};
}];