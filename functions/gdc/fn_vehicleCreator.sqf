/*
	spawn de véhicules au choix par les joueurs via BIS_fnc_garage
	Auteur : grèce de canards (Sparfell ?) ?
*/

// création de l'action pour accéder au garage
cc_action_vehiclecreator = player addaction ["<t color='#B404AE'>créer vehicule 10m devant moi</t>",{
	player allowdamage false;
	dax_p_vehicle = dax_p_vehicle - 1;
	publicVariable "dax_p_vehicle";
	// Event handler de fermeture du garage
	cc_event_closeg = [missionnamespace, "garageClosed",{
		_dir = ((getdir player) - 180);
		_veh = BIS_fnc_garage_center;
		_pos = getpos _veh;
		_class = typeOf _veh;
		// récupération des anims
		_anims_path = [(configFile >> "CfgVehicles" >> _class >> "animationSources"),0] call BIS_fnc_returnChildren;
		_anims_final = [];
		{
			_c = str _x;
			_ac = _c splitString "/";
			_c = _ac select ((count _ac) -1);
			_anims_final = _anims_final + [_c];
		} forEach _anims_path;
		_animArray = [];
		{
			_animArray = _animArray + [_x,(_veh animationPhase _x)];
		} forEach _anims_final;
		// récupération des textures
		_textures = getObjectTextures _veh;
		// suppression du vehicle et creation du nouveau
		deleteVehicle _veh;
		_veh = _class createVehicle _pos;
		_veh setdir _dir;
		_veh setpos _pos;
		_veh allowDamage false;
		_veh enableSimulation false;
		[
			_veh,
			false, 
			_animArray
		] call BIS_fnc_initVehicle;
		_count = 0;
		{
			_veh setObjectTextureGlobal [ _count, _x ];
			_count = _count + 1;
		} forEach _textures;

		clearItemCargoGlobal _veh;
		clearWeaponCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;
		/*
		_veh addWeaponCargoGlobal [(cc_ArrayATFaction select 0), 1]; //weap
		_veh addWeaponCargoGlobal [(cc_ArrayATFaction select 1), 1]; //lat
		_veh addMagazineCargoGlobal ["smokeshell", 5];
		_veh addMagazineCargoGlobal ["smokeshellBlue", 5];
		_veh addMagazineCargoGlobal [(cc_ArrayMagFaction select 0), 5]; //Gre
		_veh addMagazineCargoGlobal [(cc_ArrayMagFaction select 1), 10]; //mag1
		_veh addMagazineCargoGlobal [(cc_ArrayMagFaction select 2), 5]; //mag2
		_veh addMagazineCargoGlobal [(cc_ArrayMagFaction select 3), 4]; //magar
		_veh addMagazineCargoGlobal [(cc_ArrayMagFaction select 4), 2]; //magmg
		_veh addMagazineCargoGlobal [(cc_ArrayMagFaction select 5), 1]; //magat1
		_veh addMagazineCargoGlobal [(cc_ArrayMagFaction select 6), 1]; //magat2
		*/
		[_veh] spawn {sleep 3; (_this select 0) allowdamage true; (_this select 0) enableSimulation true; player allowdamage true;};

		[missionNamespace, "garageClosed", cc_event_closeg] call BIS_fnc_removeScriptedEventHandler; 
	}] call BIS_fnc_addScriptedEventHandler;
	// Une position 10m devant le joueur
	_pos = player getPos [10,getDir player];
	// Type de véhicule par défaut
	uinamespace setvariable ["bis_fnc_garage_defaultClass","B_Boat_Transport_01_F"];
	// Création du véhicule et ouverture de l'arsenal
	BIS_fnc_garage_center = createVehicle [ "Land_HelipadEmpty_F", _pos, [], 0, "CAN_COLLIDE" ];
	["Open",true] call BIS_fnc_garage;
},"",1.5,false,true,"","(rank player == 'SERGEANT') && (dax_p_vehicle > 0)"];

// l'action est supprimée au bout 10 minutes ou si le nombre de véhicules disponible et égal à 0
waitUntil {(dax_p_vehicle < 1) OR (time > 600)};
player removeaction cc_action_vehiclecreator;

