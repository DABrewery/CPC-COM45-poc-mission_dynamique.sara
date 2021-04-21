/* create a unique marker with one command */

params [
	"_markerPos",
	["_markerNamePrefix", "marker_"],
	["_icon", "hd_dot"],
	["_color", "colorRed"],
	["_markerText", ""]
];

private _mrk = createMarker [_markerNamePrefix + str(floor(random 100000)), _markerPos, 1];
_mrk setMarkerType _icon;
_mrk setMarkerColor _color;
_mrk setMarkerText _markerText;

_mrk