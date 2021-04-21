/* 

	Used only for players loadout
	All init code in init.sqf

	from cash-cache/harballer script

*/


// Variables pour les loadouts
playerUnit = _this select 0;	// unité du joueur (sélectionnée dans l'écran des slots)
playerIsJIP = _this select 1;	// boolean (true ou false). True = le joueur se connecte en cours de partie.

waitUntil {!isnil "dax_variables_defined"};

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//	2) CALL / COMPILE
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

call compile preprocessFileLineNumbers ("loadout\loadout_" + dax_loadout + ".sqf");

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//	3) LOADOUT
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if !(isNil {playerUnit getVariable "loadout"}) then // La variable loadout doit être placer dans l'éditeur [init de l'unité] => this setVariable ["loadout", "aaf_sl"];
{
	if (isNil {playerUnit getVariable "loadout_done"}) then // loadout_done inexistant, on lance la function loadout
	{
		[playerUnit] call hard_setLoadout;
		playerUnit setVariable ["loadout_done", true, true]; // loadout_done permet de vérifier si le loadout a été fait afin d'éviter les doublons en cas de déco / reco.
	};
};

playerUnit action ["WeaponOnBack", playerUnit]; // pour que le joueur ait l'arme baissée

if !(isMultiplayer) then
{
	{
		if !(isNil {_x getVariable "loadout"}) then 
		{
			if (isNil {_x getVariable "loadout_done"}) then 
			{
				[_x] call hard_setLoadout;
				_x setVariable ["loadout_done", true, true];
			};
		};
	} foreach allUnits;
};

player allowdamage false;

waitUntil {time > 1};
if ((uniform playerUnit) == "") then {
[playerUnit] call hard_setLoadout;
playerUnit setVariable ["loadout_done", true, true];
playerUnit action ["WeaponOnBack", playerUnit];
};

waitUntil {time > 10};
player allowdamage true;