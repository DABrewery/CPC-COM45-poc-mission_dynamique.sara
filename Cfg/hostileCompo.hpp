//Infantery groups

	//2 pax
	SMALL_ENI_INF_GROUP = [
		[_fsl_ENI, _fsl_ENI],
		[_lat_ENI, _fsl_ENI],
		[_gl_ENI, _fsl_ENI],
		[_lmg_ENI, _fsl_ENI],
		[_mg_ENI, _fsl_ENI]
	];

	//4-6 pax
	MEDIUM_ENI_INF_GROUP = [
		[_tl_ENI, _lat_ENI, _lmg_ENI, _fsl_ENI],
		[_tl_ENI, _mg_ENI, _fsl_ENI, _fsl_ENI],
		[_tl_ENI, _at_inf_ENI, _lmg_ENI, _fsl_ENI],
		[_tl_ENI, _lat_ENI, _lmg_ENI, _fsl_ENI, _fsl_ENI],
		[_tl_ENI, _at_inf_ENI, _fsl_ENI, _fsl_ENI, _fsl_ENI],
		[_tl_ENI, _mg_ENI, _fsl_ENI, _gl_ENI, _fsl_ENI],
		[_tl_ENI, _lat_ENI, _lmg_ENI, _fsl_ENI, _fsl_ENI, _fsl_ENI],
		[_tl_ENI, _at_inf_ENI, _fsl_ENI, _fsl_ENI, _fsl_ENI, _fsl_ENI],
		[_tl_ENI, _mg_ENI, _fsl_ENI, _gl_ENI, _fsl_ENI, _fsl_ENI]
	];

	//6-8 pax
	LARGE_ENI_INF_GROUP = [
		[_tl_ENI, _lat_ENI, _lmg_ENI, _fsl_ENI, _fsl_ENI, _fsl_ENI],
		[_tl_ENI, _at_inf_ENI, _fsl_ENI, _fsl_ENI, _fsl_ENI, _fsl_ENI],
		[_tl_ENI, _mg_ENI, _fsl_ENI, _gl_ENI, _fsl_ENI, _fsl_ENI],
		[_officer_ENI, _tl_ENI, _mg_ENI, _fsl_ENI, _gl_ENI, _fsl_ENI, _fsl_ENI],
		[_officer_ENI, _tl_ENI, _at_inf_ENI, _fsl_ENI, _fsl_ENI, _fsl_ENI, _fsl_ENI],
		[_officer_ENI, _tl_ENI, _mg_ENI, _fsl_ENI, _gl_ENI, _fsl_ENI, _fsl_ENI],
		[_officer_ENI, _tl_ENI, _mg_ENI, _fsl_ENI, _gl_ENI, _fsl_ENI, _fsl_ENI, _fsl_ENI],
		[_officer_ENI, _tl_ENI, _at_inf_ENI, _fsl_ENI, _fsl_ENI, _fsl_ENI, _fsl_ENI, _fsl_ENI],
		[_officer_ENI, _tl_ENI, _mg_ENI, _fsl_ENI, _gl_ENI, _fsl_ENI, _fsl_ENI, _fsl_ENI]
	];

//HMG
	HMG = _hmg_ENI;
	HMG_GUNNER = [_fsl_ENI];

//AT
	AT = _at_ENI;
	AT_GUNNER = [_fsl_ENI];

//CAR
	CAR_ENI_1 = _light_veh_ENI;
	//CAR_ENI_2 = _car_mg_ENI;

//APC
	APC_1 = _medium_veh_ENI;
	APC_1_CREW = [_crew_ENI, _crew_ENI, _crew_ENI];
	APC_1_INF = [_tl_ENI, _lat_ENI, _lmg_ENI, _fsl_ENI, _fsl_ENI, _fsl_ENI];
	//APC_2 = _APC_2_ENI;
	//APC_2_CREW = [_crew_ENI, _crew_ENI, _crew_ENI];
	//APC_2_INF = [_tl_ENI, _lat_ENI, _lmg_ENI, _fsl_ENI, _fsl_ENI, _fsl_ENI];

//IFV
	IFV_1 = _medium_veh_ENI;
	IFV_1_CREW = [_crew_ENI, _crew_ENI, _crew_ENI];
	IFV_1_INF = [_tl_ENI, _lat_ENI, _lmg_ENI, _fsl_ENI, _fsl_ENI, _fsl_ENI];
	/*
	IFV_2 = _IFV_2_ENI;
	IFV_2_CREW = [_crew_ENI, _crew_ENI, _crew_ENI];
	IFV_2_INF = [_tl_ENI, _lat_ENI, _lmg_ENI, _fsl_ENI, _fsl_ENI, _fsl_ENI];
	*/

//INF MECA
	GRP_MECA_PETIT = [_tl_ENI, _at_inf_ENI, _fsl_ENI, _tl_ENI, _mg_ENI, _fsl_ENI];

//MBT
	MBT = _heavy_veh_ENI;
	MBT_CREW = [_crew_ENI, _crew_ENI, _crew_ENI];

//Heli
	HELI_TRANSP = _heli_transp_ENI;
	HELI_TRANSP_CREW = _pilot_ENI;
	HELI_PARA = [_officer_ENI, _tl_ENI, _lmg_ENI, _lat_ENI, _fsl_ENI, _fsl_ENI, _fsl_ENI, _fsl_ENI];