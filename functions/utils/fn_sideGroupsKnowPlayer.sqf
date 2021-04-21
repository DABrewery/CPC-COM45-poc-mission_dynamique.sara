/*

Function : fn_sideGroupsKnowPlayer

Description:
	Check if any player is known by at least one group of a given side. It seems that BIS knowsAbout value,
	when used with side parameter (ex. opfor knowsAbout player), decreases very very slowly and is not set to 0 
	even if the knowsAbout value for every group of the side has been reset to 0. 

Parameter(s):
	_side - the side for which we check if the groups know the player [SIDE, defaults to opfor]
	
Returns:
	On success : an array with 0: group that knows about a player, 1: the player known, 2: knowsAbout value [ARRAY]

Examples:
(begin example)
	[opfor] call _fn_sideGroupsKnowPlayer;
(end)

Author:
    tanin69

*/

params [
	["_side", opfor]
];

private _allPlayers = playableUnits + (switchableUnits select {_x != HC_Slot}); 
private _grp = objNull;
private _player = objNull;
private _knowsVal = 0;
private _ret = [];

{   
 	_player = _x; 
 	{ 
  		private _knows = _x knowsAbout _player; 
		if (_knows > 0) exitWith { 
   			systemChat format ["Le groupe %1 a connaissance du joueur %2 : %3", _x, _player, _knows];
			_grp = _x;
			_knowsVal = _knows;
  		}; 
	} forEach (allgroups select {side _x == _side}); 
   
 } forEach _allPlayers;

if !(isNull _grp) then {
 	_ret = [_grp, _player, _knowsVal];
};

_ret