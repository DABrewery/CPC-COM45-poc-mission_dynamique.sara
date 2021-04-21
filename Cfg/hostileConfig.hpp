class dax_ennemy
{
	class dax_faction_army
	{
		faction_type = 0;
		faction_is_rhs = 0;
	};
	class dax_faction_ins
	{
		faction_type = 1;
		faction_is_rhs = 0;
	};
	class nato: dax_faction_army
	{
		class polyvalent
		{
			r = "B_Soldier_F";
			tl = "B_Soldier_SL_F";
			of = "B_officer_F"; //Added tanin
			gl = "B_Soldier_GL_F";
			lat = "B_soldier_LAT2_F";
			at = "B_soldier_AT_F";
			lmg = "B_soldier_AR_F"; //Added tanin
			mg = "B_soldier_AR_F";
			m = "B_soldier_M_F";
			aa = "B_soldier_AA_F";
			crew = "B_crew_F";
			veharray_light[] = {"B_LSV_01_armed_F","B_LSV_01_unarmed_F"}; //Modified tanin
			veharray_medium[] = {"B_APC_Tracked_01_rcws_F", "MU_NATO_Panther_unarmed", "MU_NATO_Gorgon", "B_APC_Wheeled_01_cannon_F"}; //Modified tanin
			veharray_heavy[] = {"B_MBT_01_cannon_F","B_MBT_01_TUSK_F"}; //Modified tanin
			veharray_transport[] = {"B_Truck_01_covered_F","B_Truck_01_transport_F"};
			veharray_heli[] = {"B_Heli_Transport_01_F","B_Heli_Transport_03_unarmed_F"};
			veharray_air[] = {"B_Heli_Light_01_dynamicLoadout_F","B_Heli_Attack_01_dynamicLoadout_F","B_Plane_CAS_01_dynamicLoadout_F"};
			veharray_aa[] = {"B_APC_Tracked_01_AA_F","CUP_B_HMMWV_Avenger_NATO_T"};
			hmg = "B_HMG_01_high_F";
			fixed_at = "B_static_AT_F"; //Added tanin
			fixed_aa = "B_static_AA_F"; //Added tanin
			pilot = "B_Helipilot_F";
			plane = "B_T_VTOL_01_infantry_F";
		};
		class woodland: polyvalent
		{
			r = "B_W_Soldier_F";
			tl = "B_W_Soldier_SL_F";
			of = "B_W_officer_F"; //Added tanin
			gl = "B_W_Soldier_GL_F";
			lat = "B_W_Soldier_LAT2_F";
			at = "B_W_Soldier_AT_F";
			lmg = "B_W_soldier_AR_F"; //Added tanin
			mg = "B_W_Soldier_AR_F";
			m = "B_W_soldier_M_F";
			aa = "B_W_Soldier_AA_F";
			crew = "B_W_Crew_F";
			pilot = "B_W_Helipilot_F";
		};
		class desert: polyvalent {};
		class jungle: woodland
		{
			r = "B_T_Soldier_F";
			tl = "B_T_Soldier_SL_F";
			of = "B_T_officer_F"; //Added tanin
			gl = "B_T_Soldier_GL_F";
			lat = "B_T_soldier_LAT2_F";
			at = "B_T_soldier_AT_F";
			lmg = "B_T_soldier_AR_F"; //Added tanin
			mg = "B_T_soldier_AR_F";
			m = "B_T_soldier_M_F";
			aa = "B_T_Soldier_AA_F";
			crew = "B_T_Crew_F";
			veharray_light[] = {"B_T_LSV_01_armed_F","B_T_LSV_01_unarmed_F"}; //Modified tanin
			veharray_medium[] = {"B_T_APC_Tracked_01_rcws_F", "B_T_APC_Wheeled_01_cannon_F"}; //Modified tanin  
			veharray_heavy[] = {"B_T_MBT_01_cannon_F","B_T_MBT_01_TUSK_F"}; //Modified tanin
			veharray_transport[] = {"B_T_Truck_01_transport_F","B_T_Truck_01_covered_F"};
			veharray_heli[] = {"B_CTRG_Heli_Transport_01_tropic_F","B_Heli_Transport_03_unarmed_F"};
			veharray_air[] = {"B_Heli_Light_01_dynamicLoadout_F","B_Heli_Attack_01_dynamicLoadout_F","B_Plane_CAS_01_dynamicLoadout_F"};
			veharray_aa[] = {"B_T_APC_Tracked_01_AA_F","CUP_B_HMMWV_Avenger_NATO_T"};
			fixed_at = "B_T_static_AT_F"; //Added tanin
			fixed_aa = "B_T_static_AA_F"; //Added tanin
			pilot = "B_T_Helipilot_F";
		};
		class winter: woodland
		{
			r = "B_MU_CTRG_R_F";
			tl = "B_MU_CTRG_TL_F";
			of = "B_MU_CTRG_officer_F"; //Added tanin
			gl = "B_MU_CTRG_GL_F";
			lat = "B_MU_CTRG_LAT_F";
			at = "B_MU_CTRG_AT_F";
			lmg = "B_MU_CTRG_AR_F"; //Added tanin
			mg = "B_MU_CTRG_AR_F";
			m = "B_MU_CTRG_M_F";
			aa = "B_MU_CTRG_AA_F";
			veharray_air[] = {"MU_CTRG_pawnee","B_Heli_Attack_01_dynamicLoadout_F","B_Plane_CAS_01_dynamicLoadout_F"};
			pilot = "B_MU_CTRG_helipilot_F";
		};
	};
	class csat: dax_faction_army
	{
		class polyvalent
		{
			r = "O_Soldier_F";
			tl = "O_Soldier_SL_F";
			of = "O_officer_F"; //Added tanin
			gl = "O_Soldier_GL_F";
			lat = "O_Soldier_LAT_F";
			at = "O_Soldier_HAT_F";
			lmg = "O_Soldier_AR_F"; //Added tanin
			mg = "O_HeavyGunner_F"; //Modified tanin
			m = "O_soldier_M_F";
			aa = "O_Soldier_AA_F";
			crew = "O_crew_F";
			veharray_light[] = {"O_LSV_02_armed_F", "O_LSV_02_unarmed_F", "O_MRAP_02_F"}; //Modified tanin
			veharray_medium[] = {"O_APC_Wheeled_02_rcws_v2_F"}; //Modified tanin
			veharray_heavy[] = {"O_APC_Tracked_02_cannon_F","O_MBT_02_cannon_F","O_MBT_04_cannon_F"};
			veharray_transport[] = {"O_Truck_02_transport_F","O_Truck_02_covered_F","O_Truck_03_covered_F"};
			veharray_heli[] = {"O_Heli_Transport_04_box_F","O_Heli_Light_02_unarmed_F"};
			veharray_air[] = {"O_Heli_Attack_02_dynamicLoadout_F","O_Heli_Light_02_dynamicLoadout_F","O_Plane_CAS_02_dynamicLoadout_F"};
			veharray_aa[] = {"O_APC_Tracked_02_AA_F","CUP_O_ZSU23_CSAT"};
			hmg = "O_HMG_01_high_F";
			fixed_at = "O_static_AT_F"; //Added tanin
			fixed_aa = "O_static_AA_F"; //Added tanin
			pilot = "O_helipilot_F";
			plane = "O_T_VTOL_02_infantry_dynamicLoadout_F";
		};
		class woodland: polyvalent {};
		class desert: polyvalent {};
		class jungle: woodland
		{
			r = "O_T_Soldier_F";
			tl = "O_T_Soldier_SL_F";
			of = "O_T_officer_F"; //Added tanin
			gl = "O_T_Soldier_GL_F";
			lat = "O_T_Soldier_LAT_F";
			at = "O_T_Soldier_HAT_F";
			lmg = "O_T_Soldier_AR_F"; //Added tanin
			mg = "O_T_Soldier_AR_F";
			m = "O_T_Soldier_M_F";
			aa = "O_T_Soldier_AA_F";
			crew = "O_T_Crew_F";
			veharray_light[] = {"O_T_LSV_02_armed_F", "O_T_LSV_02_unarmed_F", "O_T_MRAP_02_ghex_F"}; //Modified tanin
			veharray_medium[] = {"O_T_APC_Wheeled_02_rcws_v2_ghex_F"}; //Modified tanin
			veharray_heavy[] = {"O_T_APC_Tracked_02_cannon_ghex_F","O_T_MBT_02_cannon_ghex_F","O_T_MBT_04_cannon_F"}; //Modified tanin
			veharray_transport[] = {"O_T_Truck_03_covered_ghex_F","O_T_Truck_03_transport_ghex_F"};
			veharray_heli[] = {"O_Heli_Transport_04_box_F","O_Heli_Light_02_unarmed_F"};
			veharray_air[] = {"O_Heli_Attack_02_dynamicLoadout_F","O_Heli_Light_02_dynamicLoadout_F","O_Plane_CAS_02_dynamicLoadout_F","O_T_VTOL_02_infantry_dynamicLoadout_F"};
			veharray_aa[] = {"O_T_APC_Tracked_02_AA_ghex_F"};
			pilot = "O_T_Helipilot_F";
		};
		class winter: woodland {
			r = "O_soldierU_F";
			tl = "O_SoldierU_SL_F";
			gl = "O_SoldierU_GL_F";
			lat = "O_soldierU_LAT_F";
			at = "O_soldierU_AT_F";
			mg = "O_Urban_HeavyGunner_F"; //Modified tanin
			m = "O_soldierU_M_F";
			aa = "O_soldierU_AA_F";
		};
	};
	class fia: dax_faction_ins
	{
		class polyvalent
		{
			r = "O_G_Soldier_F";
			tl = "O_G_Soldier_SL_F";
			of = "O_G_officer_F"; //Added tanin
			gl = "O_G_Soldier_GL_F";
			lat = "O_G_Soldier_LAT2_F";
			at = "O_G_Soldier_LAT_F";
			lmg = "O_G_Soldier_AR_F"; //Added tanin
			mg = "O_G_Soldier_AR_F";
			m = "O_G_Soldier_M_F";
			aa = "I_MU_mercs_AA_F";
			crew = "O_G_Soldier_F";
			veharray_light[] = {"O_G_Offroad_01_armed_F","I_C_Offroad_02_LMG_F", "O_G_Offroad_01_F", "CUP_O_Hilux_unarmed_OPF_G_F"}; //Modified tanin
			veharray_medium[] = {"CUP_B_MTLB_pk_SLA","CUP_O_BTR60_SLA"}; //Modified tanin
			veharray_heavy[] = {"CUP_I_Hilux_armored_BMP1_NAPA", "CUP_I_Hilux_armored_zu23_NAPA", "CUP_I_T55_NAPA", "CUP_I_T72_NAPA"}; //Modified tanin
			veharray_transport[] = {"O_G_Van_02_transport_F","O_G_Van_01_transport_F"};
			veharray_heli[] = {"CUP_O_UH1H_SLA", "CUP_I_SA330_Puma_HC1_RACS", "CUP_B_MI6T_CDF"}; //Modified tanin
			veharray_air[] = {"CUP_O_UH1H_gunship_SLA", "CUP_O_Ka50_DL_SLA", "CUP_O_Mi24_D_Dynamic_SLA"}; //Modified tanin
			veharray_aa[] = {"O_G_Offroad_01_armed_F"};
			hmg = "O_HMG_01_high_F";
			fixed_at = "O_G_Offroad_01_AT_F"; //Added tanin
			fixed_aa = "O_G_HMG_02_high_F"; //Added tanin
			pilot = "O_G_Soldier_F"; //Modified tanin
			plane = "";
		};
		class woodland: polyvalent 
		{
			r = "O_MU_LIVP_soldier_r1";
			tl = "O_MU_LIVP_soldier_tl";
			gl = "O_MU_LIVP_soldier_gl";
			lat = "O_MU_LIVP_soldier_at";
			at = "O_MU_LIVP_soldier_at";
			mg = "O_MU_LIVP_soldier_ar";
			m = "O_MU_LIVP_soldier_m";
			aa = "O_MU_LIVP_soldier_aa";
			crew = "O_MU_LIVP_soldier_r2";
			veharray_light[] = {"O_MU_LIVP_offroad_armed","O_MU_LIVP_jeep_armed", "O_MU_LIVP_offroad", "O_MU_LIVP_jeep"}; //Modified tanin
			veharray_medium[] = {"CUP_O_MTLB_pk_Green_RU","CUP_O_BTR60_Green_RU"}; //Added tanin
			veharray_transport[] = {"O_MU_LIVP_kamaz_covered","O_MU_LIVP_kamaz_covered","O_MU_LIVP_truck","O_MU_LIVP_van_transport"};
			veharray_aa[] = {"O_MU_LIVP_offroad_armed"};
		};
		class desert: polyvalent
		{
			r = "O_MU_islam_R1_F";
			tl = "O_MU_islam_SL_F";
			gl = "O_MU_islam_GL_F";
			lat = "O_MU_islam_AT_F";
			at = "O_MU_islam_HAT";
			mg = "O_MU_islam_AR_F";
			m = "O_MU_islam_M_F";
			aa = "O_MU_islam_AA_F";
			crew = "O_MU_islam_R1_F";
			veharray_light[] = {"O_MU_islam_Offroad_01_armed_F","O_MU_IS_Jeep_MG", "O_MU_islam_Offroad_01_F", "O_MU_IS_Jeep"};
			veharray_transport[] = {"O_MU_islam_Van_01_F","O_MU_islam_Van_01_F"};
			veharray_aa[] = {"O_MU_islam_Offroad_01_armed_F"};
		};
		class jungle: woodland
		{
			r = "I_C_Soldier_Para_7_F";
			tl = "I_C_Soldier_Para_2_F";
			gl = "I_C_Soldier_Para_6_F";
			lat = "I_C_Soldier_Para_5_F";
			at = "I_C_Soldier_Para_5_F";
			mg = "I_C_Soldier_Para_4_F";
			m = "I_C_Soldier_Para_1_F";
			aa = "O_MU_islam_AA_F";
			crew = "I_C_Soldier_Para_7_F";
		};
		class winter: woodland {};
	};
};