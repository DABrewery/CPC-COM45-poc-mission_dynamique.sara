/* Spawn reinforcement depending on mission parameters */

params [
	"_AoI",
	"_AoIMrk"
];

if !(isServer) exitWith {};

//Test only
	goReinf = true;

waitUntil {
	sleep 5;
	goReinf;
};

//Get mission parameters
	private _hostileForce      = "HostileForce" call BIS_fnc_getParamValue;
	private _hostileStrenght = "HostileStrenght" call BIS_fnc_getParamValue;
	private _reinfFrequency    = "Reinforcements" call BIS_fnc_getParamValue;

//Reinforcement balance variables
	private _freqReinforcements = 0;
	private _randomDelay = 0;
	private _probaPara = 0;
	private _probaMeca = 0;
	private _probaMBT = 0;
	private _mbtConvoy = [];
	private _nbParadrop = 0;
	private _nbTotReinf = 0;
	private _maxReinf = 0;

//Reinforcement parameters
	private _distanceParadrop = 300;
	private _distanceUnload = 500;
	private _reinfHeliSpawnPos = getMarkerPos "mrkSpawnAerial"; //should be replaced by a dynamic generated position (far from nearest player)
	private _reinfArmorSpawnPos = [];
	private _reinfHeli = HELI_TRANSP;
	private _heliCrew = HELI_TRANSP_CREW;
	private _grpPara = HELI_PARA;
	private _grpInfMeca = GRP_MECA_PETIT;
	private _ifv = IFV_1;
	private _ifvCrew = IFV_1_CREW;
	private _mbt = MBT;

switch (_reinfFrequency) do {
	case 2: { //low frequency reinforcements : every 20 to 30 minutes
		_freqReinforcements = 1200;
		_randomDelay = 600;
	};
	case 3: { //medium frequency reinforcements	: every 15 to 20 minutes	
		_freqReinforcements = 900;
		_randomDelay = 300;
	};
	case 4: { //high frequency reinforcements : every 8 to 10 minutes			
		_freqReinforcements = 480;
		_randomDelay = 120;
	};
	case 5: { //infinite reinforcements : every 10 to 12 minutes
		_freqReinforcements = 600;
		_randomDelay = 120;
	};
};

//Test only
/*
_freqReinforcements = 60;
_randomDelay = 0;
*/

switch (_hostileForce) do {
	case 1: { //mainly infantery : paradrops
		switch (_hostileStrenght) do {
			case 1: { //
				_probaPara = 1;
				_nbParadrop = 1;
				_probaMeca = 0.1;
				_probaMBT = 0;
				_maxReinf = selectRandom [2,3,4];
			};
			case 2: { //medium infantery groups	
				_probaPara = 1;
				_nbParadrop = 2;
				_probaMeca = 0.1;
				_probaMBT = 0;
				_maxReinf = selectRandom [4,5,6];
			};
			case 3: { //large infantery groups			
				_probaPara = 1;
				_nbParadrop = 3;
				_probaMeca = 0.2;
				_probaMBT = 0;
				_maxReinf = selectRandom [6,7,8];
			};
		};
	};
	case 2: { //mainly armored : mecanized infantery and MBT
		switch (_hostileStrenght) do {
			case 1: {
				_probaPara = 0.1;
				_probaMeca = 0.5;
				_probaMBT = 0.3;
				_mbtConvoy = [selectRandom _mbt, selectRandom _mbt];
				_maxReinf = selectRandom [2,3,4];
			};
			case 2: {		
				_probaPara = 0.2;
				_probaMeca = 0.6;
				_probaMBT = 0.3;
				_mbtConvoy = [selectRandom _mbt, selectRandom _mbt, selectRandom _mbt];
				_maxReinf = selectRandom [4,5,6];
			};
			case 3: {				
				_probaPara = 0.3;
				_probaMeca = 0.7;
				_probaMBT = 0.4;
				_mbtConvoy = [selectRandom _mbt, selectRandom _mbt, selectRandom _mbt, selectRandom _mbt];
				_maxReinf = selectRandom [6,7,8];
			};
		};
	};
	case 3: { //combined arms : TODO

	};
};

//Main loop for reinforcements
while {goReinf} do {
	
	//If at least one player position is known by ENI, reinforcements will rush on players. Else, they will reinforce FOB.
	private _isPlayerKnownByENI = false;
	if (count ([opfor] call dax_fnc_sideGroupsKnowPlayer) > 0) then {
		_isPlayerKnownByENI = true;
	};
	
	//Paradrop reinforcements
	if (random 1 < _probaPara) then {
		for "_i" from 1 to _nbParadrop do {
			//Position of at least one player known by ENI : reinforcements are send at the known position
			if (_isPlayerKnownByENI) then {
				//Get the position to attack
				private _tbPosAttack = [_reinfHeliSpawnPos, nil, _distanceParadrop] call dax_fnc_findUnloadPos;
				//Launch paradrop reinforcement
				private _groupPara = [
						_reinfHeliSpawnPos,
						_tbPosAttack#0,
						_reinfHeliSpawnPos,
						opfor,
						[selectRandom _reinfHeli, _heliCrew, 300],
						_grpPara,
						"FULL"
				]  spawn GDC_fnc_lucySpawnGroupInfParadrop;
				_nbTotReinf = _nbTotReinf + 1;
				systemChat format ["Vague de renforts n°%1 : renforts para envoyés en %2", _nbTotReinf, _reinfHeliSpawnPos];
				sleep 15;				
			//No player position known by ENI : reinforcements jump on the FOB, where they garrison
			} else {
				private _groupPara = [
					_reinfHeliSpawnPos,
					getMarkerPos _AoIMrk,
					_reinfHeliSpawnPos,
					opfor,
					[selectRandom _reinfHeli, _heliCrew, 300],
					_grpPara,
					"FULL"
				] call GDC_fnc_lucySpawnGroupInfParadrop;
				_nbTotReinf = _nbTotReinf + 1;
				systemChat format ["Vague de renforts n°%1 : renforts para envoyés en garnison sur la FOB.", _nbTotReinf];
				sleep 15;
			};
		};
	};

	//Mechanized infantry reinforcements
	if (random 1 < _probaMeca) then {
		//Determine spawn point for mech : find a city near FOB and far enough from nearest player
		_reinfArmorSpawnPos = [getMarkerPos _AoIMrk] call dax_fnc_findSafeSpawnPos;
		//Position of at least one player known by ENI : reinforcements are sent to the known position		
		if (_isPlayerKnownByENI) then {
			private _tbPosAttack = [_reinfArmorSpawnPos#0, nil, _distanceUnload] call dax_fnc_findUnloadPos;
			[[_reinfArmorSpawnPos#0, _tbPosAttack#0, _tbPosAttack#1], opfor, _grpInfMeca, selectRandom _ifv, _reinfArmorSpawnPos#1] spawn dax_fnc_spawnMechInfantry;
			_nbTotReinf = _nbTotReinf + 1;
			systemChat format ["Vague de renforts n°%1 : renforts méca envoyés sur position %2.", _nbTotReinf, _reinfArmorSpawnPos#0];
			sleep 15;
		//No player position known by ENI : reinforcements sent on patrol in attack zone
		} else {
			_grpInf = [[0,0,0], opfor, _grpInfMeca] call GDC_fnc_lucySpawnGroupInf;
			_tbVeh = [_reinfArmorSpawnPos#0, _reinfArmorSpawnPos#1, selectRandom _ifv, _grpInf] call BIS_fnc_spawnVehicle;
			sleep 3;
			{_x moveInCargo (_tbVeh#0)} forEach units _grpInf;
			sleep 3;
			[_tbVeh#2, "marker_zone", nil, ["MOVE", "FULL", "SAFE", "RED", "COLUMN"], ["water", _AoIMrk]] call dax_fnc_lucyVehicleRandomPatrol;
			_nbTotReinf = _nbTotReinf + 1;
			systemChat format ["Vague de renforts n°%1 : renforts méca envoyés en patrouille sur zone.", _nbTotReinf];
			sleep 15;
		};
	};

	//Heavy armor reinforcements
	if (random 1 < _probaMBT) then {
		_reinfArmorSpawnPos = [getMarkerPos _AoIMrk] call dax_fnc_findSafeSpawnPos;
		[_reinfArmorSpawnPos#0, selectRandom _mbt,  _mbtConvoy, getMarkerPos _AoIMrk] call dax_fnc_spawnConvoy;
		_nbTotReinf = _nbTotReinf + 1;
		systemChat format ["Vague de renforts n°%1 : convoi de MBT envoyés sur la FOB.", _nbTotReinf];
		sleep 15;
	};

	//If reinforcements are not infinite, check end condition for reinforcements
	if (_reinfFrequency < 5 && {_nbTotReinf >= _maxReinf}) then {goReinf = false};

	//delay between reinforcement waves
	sleep _freqReinforcements + random _randomDelay;
};