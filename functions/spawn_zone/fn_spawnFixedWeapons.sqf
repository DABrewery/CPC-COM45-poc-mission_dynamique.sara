/* ----------------------------------------------------------------------------
Function: fn_spawnFixedWeapons

Description:
	Spawns fixed weapons on markers with probabilies and allow surrounding units to use the weapon if it's empty.

	Probabilities are :
	* the fixed weapon will be spaned
	* if the fixed weapin is spawned, probabilty to be occupied by a gunner
	* if there are known hostiles nearby and if the weapon is not used, probabily that the nearest AI unit of side use it

Parameters:
	_tbMrk - Names of the markers on which the fixed weapons are spawned [ARRAY of STRINGS]
	_offset - offset of spawn pos [ARRAY]. E.g : [0,2,0] is an offset of two meters back from previous marker position
	_side - side of the group (opfor, blufor, independent) [SIDE, defaults to opfor]
	_clsFixedW - class name for the fixed weapon [STRING, defaults to "rhsgref_ins_DSHKM"]
	_clsGunner - class name for the gunner of the fixed weapon [ARRAY, default to ["rhsgref_ins_rifleman"]]
	_probaFixedW - probability that the fixed weapon will be spawned [NUMBER, defaults to 0.5]
	_probaGunner - probability that the fixed weapon will be manned [NUMBER, defaults to 0.5]
	_probaOrderGunner - probability that the fixed weapon will be manned if empty (wether not manned at spawned or if the gunner was killed) 

Returns:
	Nothing

Examples:
    (begin example)
	[["marker_1", "marker_2"]] spawn fn_spawnFixedWeapons;
	//Spawn (with proba) a fixed weapon on marker "marker_1" and another on marker "marker_2" with defaults params
    (end)
	
	(begin example)
	[["marker_1", "marker_2", "marker_3"], independent, "rhsgref_ins_DSHKM", "rhsgref_ins_rifleman", 1, 0.1, 1] spawn fn_spawnFixedWeapons;
	//Spawn (with a proba of 1) 3 fixed weapons on markers, side independant, with a weapon class name "rhsgref_ins_DSHKM", used (with a proba of 0.1) by a soldier of class name "rhsgref_ins_rifleman" and that will be used if empty AND if known ennemies are nearby (with a proba of 1)
    (end)

Author:
	tanin69
---------------------------------------------------------------------------- */

//Rayon de détection (mètres) du pseudo trigger, avec le marqueur reçu en paramètre comme centre
#define RDETECT 300
//Rayon (mètres) dans lequel des IA recevront l'ordre de monter dans l'arme fixe, avec le marqueur reçu en paramètre comme centre
#define RMOUNT 30


params [
	"_tbMrk",
	["_offset", []],
	["_side", opfor],
	["_clsFixedW", "rhsgref_ins_DSHKM"],
	["_clsGunner", ["rhsgref_ins_rifleman"]],
	["_probaFixedW", 0.5],
	["_probaGunner", 0.5],
	["_probaOrderGunner", 0.8]
];

//Le groupe de l'arme et l'éventuel gunner spawné
private _grp    = "";
//L'arme spawnée
private _fw     = "";
//Side du groupe au format EAST, WEST, etc.
private _sideComp = "";
//Tableau des joueurs
private _all_players = [];

//Tableau des joueurs
if (isMultiplayer) then {
	_all_players = playableUnits;
} else {
	_all_players = switchableUnits;
};

//Convertit la side au format opfor, blufor, etc. utilisé par LUCY en side au format EAST, WEST, etc. utilisé par certaines fonctions BI
switch (_side) do {
	case opfor:       {_sideComp = EAST};
	case independent: {_sideComp = RESISTANCE};
	case blufor:      {_sideComp = WEST};
};

//Fonction pour qu'un gunner monte dans une arme fixe
gunnerMount = {
	params ["_mrkD","_fwD", "_sideComp","_probaOrderGunner"];
	private _u="";
	while {true} do {
		/*
		//DBG start
		_str = "DBG_spawnFixedWeapons: : gunnerMount alive !";
		systemChat _str;
		//DBG end
		*/
		if (isNull assignedGunner _fwD) then {
			if (random 1 < _probaOrderGunner) then {
				_u = [allUnits select {side _x == _sideComp} inAreaArray [getMarkerPos _mrkD,RMOUNT,RMOUNT,0,false]] call BIS_fnc_nearestPosition;
				if (typeName _u != "ARRAY") then {
					_u assignAsGunner _fwD;
					[_u] orderGetIn true;
					/* DBG start
					_str = "DBG_spawnFixedWeapons: : " + str(_u) + " a reçu l'ordre de monter dans l'arme fixe " + str(_fwD);
					systemChat _str;
					DBG end */
				};
			};
		};
		sleep 5;
	};	
};

{

	//Le nom du marqueur de l'arme fixe
	private _mrk = _x;
	//La position de spawn
	private _spawnPos = getMarkerPos _mrk;	
	//Azimut vers lequel pointe l'arme. Récupéré par la direction du marqueur
	private _azim = markerDir _x;
		
	// Spawn une arme fixe selon une proba sur la position du marqueur reçu en paramètre
	if (random 1 < _probaFixedW) then {
		//Si l'arme fixe est spawnée, il y a une proba que le tireur soit spawné avec l'arme
		if (random 1 < _probaGunner) then {
			_grp = [_spawnPos, _side, _clsFixedW, _clsGunner, _azim,["NONE", 0, 0],-1] call GDC_fnc_lucySpawnVehicle;
			
			if (count _offset > 0) then {
				(_grp#1) setPos ((_grp#1) modelToWorld _offset)
			};
			
		}
		//Sinon, on spawn l'arme sans tireur
		else {
			_grp = [_spawnPos,_side,_clsFixedW,[],_azim,["NONE", 0, 0],-1] call GDC_fnc_lucySpawnVehicle;
			
			if (count _offset > 0) then {
				(_grp#1) setPos ((_grp#1) modelToWorld _offset)
			};
			
		};
		_fw = _grp#1;
		//Pseudo trigger : scanne si une unité hostile (ou une unité jouable) a repéré un joueur dans le rayon RDETECT
		[_spawnPos, _mrk,_fw,_sideComp,_probaOrderGunner,_all_players] spawn {
			params ["_spawnPos", "_mrk", "_fw", "_sideComp", "_probaOrderGunner", "_all_players"];
			private _hdl = scriptNull;
			/*
			//DBG start
			private _compteBoucle = 1;
			_str = "DBG_spawnFixedWeapons: Boucle de détection démarrée sur le marqueur " + str(_mrk);
			systemChat _str;
			//DBG end
			*/
			while {true} do {
				private _menace       = false;
				private _tbPlayers    = _all_players select {_x != HC_Slot} inAreaArray [_spawnPos, RDETECT, RDETECT, 0, false];
				private _tbHostiles   = allUnits select {side _x == _sideComp} inAreaArray [_spawnPos, RDETECT, RDETECT, 0, false];
				
				{
					private _opfor = _x;
					{
						//si un joueur a été repéré, on quitte la boucle sur les joueurs
						if (_opfor knowsabout _x > 1.4) exitWith {
							_menace = true;
							/*
							//DBG start
							_str = "DBG_spawnFixedWeapons: Menace dans _tbPlayers :" + str(_menace);
							systemChat _str;
							//DBG end
							*/
						};		
					} forEach _tbPlayers;
					//DBG
					//_str="DBG_spawnFixedWeapons: Menace dans _tbOpfor :" + str(_menace);systemChat _str;
					//si un joueur a été repéré, quitte la boucle sur les IA hostiles
					if (_menace) exitWith{};
				} count _tbHostiles;
				/*
				//DBG start
				_str = "DBG_spawnFixedWeapons: Boucle n° " + str(_compteBoucle);
				systemChat _str;
				_compteBoucle = _compteBoucle +1;
				//DBG end
				*/

				//Si un joueur a été repéré, on lance la fonction "d'automount" du gunner à condition qu'elle n'ait pas été déjà lancée
				if (_menace) then {
					if (isNull _hdl) then {
						_hdl=[_mrk,_fw,_sideComp,_probaOrderGunner] spawn gunnerMount;
						/*
						//DBG start
						_str = "DBG_spawnFixedWeapons: gunnerMount appelé...";
						systemChat _str;
						//DBG end
						*/
					};				
				//Si pas ou plus de menace, on termine la fonction d'automount et on désassigne un éventuel gunner
				} else {
					if !(isNull _hdl) then {
						terminate _hdl;
						sleep 5;
						private _fwGunner = gunner _fw;
						if !(isNull _fwGunner) then {
							unassignVehicle _fwGunner;
							/*
							//DBG start
							_str = str(_fwGunner) + " a reçu l'ordre de lâcher l'arme " + str(_fw);
							systemChat _str;
							//DBG end
							*/	
						};
						/*
						//DBG start
						_str = "DBG_spawnFixedWeapons: gunnerMount terminé.";
						systemChat _str;
						//DBG end
						*/
					};
				};
				
				sleep 5;
			};
		};
	};

} forEach _tbMrk;