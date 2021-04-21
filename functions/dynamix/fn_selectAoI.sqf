//Select an AoI from possible AoIs and game style parameter
	
#define HOSTILE_ZONE_DIAM 900

params [
	"_AoIsPath"
];



private _AoIs = [];

//Grab AiO names from config
{
	_cleanAoI = (str _x) splitString "/";
	_AoIs pushBack (_cleanAoI select count _cleanAoI - 1);
} forEach _AoIsPath;

//Choose a random AoI from selected AoIs
_selectedAoI = selectRandom _AoIs;
//Test only : 
//private _selectedAoI = "Pesadas";
//hint format ["AoIs sélectionnée : %1", _selectedAoI];
		
//Get marker name for this AoI
_AoIMrk = getText (missionConfigFile >> "areasOfInterest" >> _selectedAoI >> "markerName");

//Create a marker that shows attack zone to players
_playerMrk = createMarker ["marker_zone", getMarkerPos _AoIMrk];
_playerMrk setMarkerSize [HOSTILE_ZONE_DIAM, HOSTILE_ZONE_DIAM];
_playerMrk setMarkerShape "ELLIPSE";
_playerMrk setMarkerBrush "Border";
_playerMrk setMarkerColor "ColorRed";

[_selectedAoI, _AoIMrk]