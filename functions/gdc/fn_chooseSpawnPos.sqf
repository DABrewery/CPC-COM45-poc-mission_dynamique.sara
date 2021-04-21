/*
	Author: Sparfell

	Description:
	this function will allow the players to choose their spawn position during the briefing by moving a marker on the map using leftmousebutton
	
	Parameter(s):
		0 : STRING - name of the marker that will be moved, the marker defines the spawn position
		1 (Optional): ARRAY - array fo objects that will be moved on selected position (default: []) if [] all playableunits will be moved
		2 (Optional): STRING - rank required in order to be able to move the marker (default: "SERGEANT")
		3 (Optional): STRING or ARRAY[string] - list of marker names or trigger names defining blacklisted areas (default: [])
		4 (Optional): NUMBER - 0: land only, 1: land and water, 2: water only (default: 1)
		5 (Optional): NUMBER - max spawn distance from marker (default: 30)
		6 (Optional): NUMBER - min spawn distance from terrain object (default: 4)
		7 (Optional): STRING or ARRAY[string] - area where the user can move the marker, if nothing passed, the whole map is allowed (default: [])

	Returns:
	nothing
*/

params [
	"_mk",
	["_units", [], [[]]],
	["_rank", "SERGEANT", [""]],
	["_blist", [], ["", []]],
	["_water", 1, [0]],
	["_maxDist", 30, [0]],
	["_objDist", 4, [0]],
	["_wlist", [], ["", []]]
];

_blist = [_blist, []] call dax_fnc_secureStringArrayToArray;
_wlist = [_wlist, []] call dax_fnc_secureStringArrayToArray;

// Si le le 2e paramètre n'est pas renseigné toutes les unités jouables sont déplacées
// Cette condition n'est pas bonne si le tableau n'est pas vide, autrement dit si des objets sont spawnés en même temps que des joueurs
if ((count _units) == 0) then {
	if (isMultiplayer) then {
		_units = playableUnits;
	} else {
		_units = switchableUnits;
	};
};

// si le joueur a le rang requis il peut déplacer le marqueur avec un clic gauche sur la carte
if (rank player == _rank) then {
	
	[_mk, _wlist, _blist, _water] onMapSingleClick {
		params ["_mk", "_wlist", "_blist", "_water"];

		_valid = true;
		// Check if there is a whitelisted area
		// If there is no whitelist marker, it is valid because all map is valid
		if !(count _wlist == 0) then {
			_valid = false;
			{
				if (_pos inArea _x) then {
					_valid = true;
				};
			} forEach (_wlist);
		};

		// on check si la position choisie n'est pas dans les zones blacklistées
		{
			if (_pos inArea _x) then {
				_valid = false;
			};
		} forEach (_blist);

		// on check si la position choisie est sur l'eau ou pas en fonction du paramètre
		if (_water != 1) then {
			switch _water do {
				case 0: {if (surfaceIsWater _pos) then {_valid = false};};
				case 2: {if !(surfaceIsWater _pos) then {_valid = false};};
				default {_valid = false};
			};
		};
		// déplacement du marqueur
		if (_valid) then {
			_mk setmarkerPos _pos;
		};
	};
};

[_units, _mk, _maxDist, _objDist, _water] spawn {
	params ["_units", "_mk", "_maxDist", "_objDist", "_water"];

	private ["_pos"];
	// au début de la mission, désactivation de la possibilité de déplacer le marqeur
	waituntil {time > 0};
	onMapSingleClick "";
	{
		_x allowdamage false;
	} forEach (_units);

	// déplacement des objects sélectionnés sur la zone d'insertion
	if (isServer) then {
		// déplacer sur une position sûre
		{
			_pos = [
				(markerPos _mk),
				0,
				_maxDist,
				_objDist,
				_water,
				0,
				0,
				[],
				(markerPos _mk)
			] call BIS_fnc_findSafePos;

			if (isPlayer _x) then {
				[_x,_pos] remoteExec ["setpos",_x];
			} else {
				_x setpos _pos;
			};
		} forEach (_units);
	};
	sleep 10;
	{
		_x allowdamage true;
	} forEach (_units);
};