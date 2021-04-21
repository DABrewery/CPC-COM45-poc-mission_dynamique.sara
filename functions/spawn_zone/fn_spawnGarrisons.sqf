/* ----------------------------------------------------------------------------
Function: fn_spawnGarrisons

Description:
	Spawns garrison groups on markers

Parameters:
	_tbMrk - Names of the markers on which the groups are spawned [ARRAY of STRINGS]
	_groupCompo - Array of group compositions to spawn. E.g. : [["rhsgref_ins_squadleader", "rhsgref_ins_rifleman_aks74"],["rhsgref_ins_militiaman_mosin", "rhsgref_ins_rifleman_aks74"]] [ARRAY]
	_side - side of the group (opfor, blufor, independent) [SIDE, defaults to opfor]
	_radius - radius in which units garrison (CBA_fnc_taskDefend) [NUMBER, defaults to 40]
	_threshold - fortification minimal threshold for AI to fortify (CBA_fnc_taskDefend) [NUMBER, defaults to 2]
	_patrol - probability that a group to patrol in place of fortify (CBA_fnc_taskDefend) [NUMBER defaults to 0]
	_hold - probability that units stay fortified if they are attacked (CBA_fnc_taskDefend) [NUMBER defaults to 0.7]

Returns:
	Nothing

Examples:
    (begin example)
	[["marker_1", "marker_2", "marker_3], [["rhsgref_ins_squadleader", "rhsgref_ins_rifleman_aks74"],["rhsgref_ins_militiaman_mosin", "rhsgref_ins_rifleman_aks74"]], opfor, 40, 4, 0.1, 1] spawn dax_fnc_spawnGarrisons;
    (end)

Author:
	tanin69
---------------------------------------------------------------------------- */

params [
	"_tbMrk",
	"_groupCompo",
	["_side",opfor],
	["_radius", 40],
	["_threshold", 2],
	["_patrol", 0],
	["_hold", 0.7]
];

{
	private _pos = getMarkerPos _x;
	_grp = [_pos, _side, selectRandom _groupCompo] call GDC_fnc_lucySpawnGroupInf;
	[_grp, nil, _radius, _threshold, _patrol, _hold] call CBA_fnc_taskDefend;
} forEach _tbMrk;