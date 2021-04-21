/* Hide objects around a position */
	
	params [
		"_center",
		"_radius"
		];

	#define MAP_TYPES_BUILDING			["BUILDING","HOUSE","CHURCH","CHAPEL","FUELSTATION","HOSPITAL","RUIN","BUNKER"]
	#define MAP_TYPES_VEGETATION		["TREE","SMALL TREE","BUSH"]
	#define MAP_TYPES_WALL				["WALL","FENCE"]
	#define MAP_TYPES_MISC				["ROCK","ROCKS","FOREST BORDER","FOREST TRIANGLE","FOREST SQUARE","CROSS","FORTRESS","FOUNTAIN","VIEW-TOWER","LIGHTHOUSE","QUAY","HIDE","BUSSTOP","ROAD","FOREST","TRANSMITTER","STACK","TOURISM","WATERTOWER","TRACK","MAIN ROAD","POWER LINES","RAILWAY","POWERSOLAR","POWERWAVE","POWERWIND","SHIPWRECK","TRAIL"]

	#define CATEGORY_COMP				[MAP_TYPES_BUILDING,MAP_TYPES_WALL,MAP_TYPES_VEGETATION,MAP_TYPES_MISC]

	{
		_objs = nearestTerrainObjects [_center, _x, _radius, false, true];
		//hintsilent format["%1", _objs ];
		{
			_x hideObjectGlobal true;
			_x allowDamage false;

		} foreach _objs;

	} foreach CATEGORY_COMP;