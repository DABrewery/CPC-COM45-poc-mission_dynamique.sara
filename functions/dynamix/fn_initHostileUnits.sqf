/* Hostile IA faction and group definition */

//Faction unit types
	private _fsl_ENI    	 = getText (missionConfigFile >> "dax_ennemy" >> dax_hostileFaction >> dax_IAcamo >> "r");
	private _lat_ENI    	 = getText (missionConfigFile >> "dax_ennemy" >> dax_hostileFaction >> dax_IAcamo >> "lat");
	private _aa_inf_ENI    	 = getText (missionConfigFile >> "dax_ennemy" >> dax_hostileFaction >> dax_IAcamo >> "aa");
	private _at_inf_ENI    	 = getText (missionConfigFile >> "dax_ennemy" >> dax_hostileFaction >> dax_IAcamo >> "at");
	private _lmg_ENI    	 = getText (missionConfigFile >> "dax_ennemy" >> dax_hostileFaction >> dax_IAcamo >> "lmg");
	private _mg_ENI     	 = getText (missionConfigFile >> "dax_ennemy" >> dax_hostileFaction >> dax_IAcamo >> "mg");
	private _marskman_ENI    = getText (missionConfigFile >> "dax_ennemy" >> dax_hostileFaction >> dax_IAcamo >> "m");
	private _gl_ENI     	 = getText (missionConfigFile >> "dax_ennemy" >> dax_hostileFaction >> dax_IAcamo >> "gl");
	private _tl_ENI     	 = getText (missionConfigFile >> "dax_ennemy" >> dax_hostileFaction >> dax_IAcamo >> "tl");
	private _officer_ENI   	 = getText (missionConfigFile >> "dax_ennemy" >> dax_hostileFaction >> dax_IAcamo >> "of");
	//private _medic_ENI  	 = "";
	private	_crew_ENI     	 = getText (missionConfigFile >> "dax_ennemy" >> dax_hostileFaction >> dax_IAcamo >> "crew");
	private	_pilot_ENI    	 = getText (missionConfigFile >> "dax_ennemy" >> dax_hostileFaction >> dax_IAcamo >> "pilot");
	private	_light_veh_ENI 	 = getArray (missionConfigFile >> "dax_ennemy" >> dax_hostileFaction >> dax_IAcamo >> "veharray_light");
	private	_medium_veh_ENI	 = getArray (missionConfigFile >> "dax_ennemy" >> dax_hostileFaction >> dax_IAcamo >> "veharray_medium");
	private	_heavy_veh_ENI 	 = getArray (missionConfigFile >> "dax_ennemy" >> dax_hostileFaction >> dax_IAcamo >> "veharray_heavy");
	private _hmg_ENI         = getText (missionConfigFile >> "dax_ennemy" >> dax_hostileFaction >> dax_IAcamo >> "hmg");
	private _AT_ENI			 = getText (missionConfigFile >> "dax_ennemy" >> dax_hostileFaction >> dax_IAcamo >> "fixed_at");
	private _AA_ENI       	 = getText (missionConfigFile >> "dax_ennemy" >> dax_hostileFaction >> dax_IAcamo >> "fixed_aa");;
	private	_mot_AA_ENI   	 = getArray (missionConfigFile >> "dax_ennemy" >> dax_hostileFaction >> dax_IAcamo >> "veharray_aa");
	private	_transp_ENI 	 = getArray (missionConfigFile >> "dax_ennemy" >> dax_hostileFaction >> dax_IAcamo >> "veharray_transport");
	//private	_car_1_ENI    	 = "";
	//private	_car_mg_ENI   	 = "";
	private	_heli_transp_ENI = getArray (missionConfigFile >> "dax_ennemy" >> dax_hostileFaction >> dax_IAcamo >> "veharray_heli");
	private	_air_attack_ENI  = getArray (missionConfigFile >> "dax_ennemy" >> dax_hostileFaction >> dax_IAcamo >> "veharray_air");
	private	_plane_transp_ENI= getText (missionConfigFile >> "dax_ennemy" >> dax_hostileFaction >> dax_IAcamo >> "plane");

/*******************************************/
/*             IA GROUP DEF                */
/*******************************************/

#include "..\..\Cfg\hostileCompo.hpp"