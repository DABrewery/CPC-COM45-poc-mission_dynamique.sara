/*
	Change la side d'unités au sein d'une zone
*/

params [
	"_area",
	["_sideBefore", civilian],
	["_sideAfter", resistance]
 ];

_grp = createGroup _sideAfter;

//Itère sur tous les civils de la map
{
	//Sélectionne les civils dans le trigger
	if (_x inArea _area) then {
		[_x] joinSilent _grp;
	}
	
} forEach units _sideBefore;