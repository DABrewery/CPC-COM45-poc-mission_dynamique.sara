/* 

	Used only for friendly IA loadout
	All init code in init.sqf

	from cash-cache/harballer script

*/

waitUntil {!isnil "dax_variables_defined"};

// loadout pour les IA
call compile preprocessFileLineNumbers ("loadout\loadout_" + dax_loadout + ".sqf");
{
	if !(isNil {_x getVariable "loadout"}) then 
	{
		if (isNil {_x getVariable "loadout_done"}) then 
		{
			[_x] call hard_setLoadout;
			_x setVariable ["loadout_done", true, true];
		};
	};
} foreach (allUnits select {((side _x) == blufor) && (!isPlayer _x)});