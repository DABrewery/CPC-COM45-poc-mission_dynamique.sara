/* ----------------------------------------------------------------------------
Function: fn_spawnRdmPatrols

Description:
	Spawns partially randomized number of groups on markers that will randomly patrol an area

Parameters:
	_tbMrk - Names of the markers on which the groups are spawned [ARRAY of STRINGS]
	_area - shape marker name in which the group will randomly patrol [STRING]
	_rdmNum - Number of groups to spawn on the markers [ARRAY of NUMBERS]
	_groupCompo - Array of group compositions to spawn. E.g. : [["rhsgref_ins_squadleader", "rhsgref_ins_rifleman_aks74"],["rhsgref_ins_militiaman_mosin", "rhsgref_ins_rifleman_aks74"]] [ARRAY of ARRAY]
	_side - side of the group (opfor, blufor, independent) [SIDE, defaults to opfor]
	
Returns:
	Nothing

Examples:
    (begin example)
	[["marker_1", "marker_2", "marker_3], "marker_patrol", [2,4,6], ["rhsgref_ins_squadleader", "rhsgref_ins_rifleman_aks74","rhsgref_ins_militiaman_mosin"], opfor] spawn fn_spawnRdmPatrols;
	//Will spawn 2, 4 or 6 groups on markers (randomly chosen), with one of the two compositions (randomly chosen). Groups will patrol "marker_patrol" marker area.
    (end)

Author:
	tanin69
---------------------------------------------------------------------------- */

params [
	"_tbMrk",
	"_area",
	"_rdmNum",
	"_groupCompo",
	"_side"
];

private _nbPat = selectRandom _rdmNum; 
private _spawn = [];
private _grp =[];

for "_i" from 1 to _nbPat do {
	_spawn = selectRandom  _tbMrk;
	_grp = [(getMarkerPos _spawn), _side, selectRandom _groupCompo] call GDC_fnc_lucySpawnGroupInf;
	_grp setVariable ["PLUTO_ORDER","QRF"];
	[_grp, _area] call GDC_fnc_lucyGroupRandomPatrol;
};