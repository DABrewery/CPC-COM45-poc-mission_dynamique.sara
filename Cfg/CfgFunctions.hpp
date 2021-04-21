class CfgFunctions {

	#include "..\functions\external\LARs\spawnComp\functions\functions.hpp"

	class dax
	{
		class dynamix
		{
			file="functions\dynamix";
			class initCommonVariables {};
			class initHostileUnits {};
			class selectAoI {};
			class buildAoI_attack {};
			class buildAoI_rush {};
			class spawnReinforcements {};
		};

		class utils
		{
			file="functions\utils";
			class hideObjects {};
			class createMarker {};
			class findRdmSafePos {};
			class sideGroupsKnowPlayer {};
			class findUnloadPos {};
			class findSafeSpawnPos {};
		};

		class gdc
		{
			file="functions\gdc";
			class chooseSpawnPos {};
			class secureStringArrayToArray {};
			class lucyVehicleRandomPatrol {};
			class vehicleCreator {};
		}

		class spawn_zone
		{
			file="functions\spawn_zone";
			class spawnFixedWeapons {};
			class spawnGarrisons {};
			class spawnRdmPatrols {};
			class spawnMechInfantry {};
			class spawnConvoy {};
		};

	}; 

};