class Params
{
	class GameStyle
	{
		title = "=| Style de jeu |=";
		texts[] = {"Attaque d'une zone ennemie","Défense d'une zone (non implémenté)","Assaut sur une zone à conquérir (non implémenté)", "attaque de convoi (non implémenté)"};
		values[] = {1,2,3,4};
		default = 1;
	};

	class playerFaction
	{
		title = "Joueurs   -| faction |-";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,15,16,17,18,19,20,21,22};
		texts[] = 
		{
			"OTAN", //0
			"CSAT", //1
			"AAF", //2
			"US Army", //3
			"US Marines", //4
			"US forces spéciales", //5
			"Russie 2000", //6
			"Russie 2015", //7
			"Russie forces spéciales", //8
			"KSK", //9
			"BAF", //10
			"RACS", //11
			"Armée takistanaise", //12
			"Insurgés (adaptatifs)", //13
			"SAF", //15
			"CDF", //16
			"PMC", //17
			"FR", //18
			"Armée occidentale", //19
			"US 1980", //20
			"URSS 1980", //21
			"US vietnam" //22
		};
		default = 19;
	};

	class Garage
	{
		title = "Joueurs   -| véhicules |-";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,100};
		texts[] = {"Aucun","1","2","3","4","5","6","7","8","9","10","100"};
		default = 0;
	}

	class nvg
	{
		title = "Joueurs   -| équipement nocturne |-";
		values[] = {0,1,2};
		texts[] = {"Rien","NVG","Lampes et/ou NVG (quand possible)"};
		default = 0;
	};

	class hostileFaction
	{
		title = "Hostiles   -| faction |-";
		values[] = {
			1,2,3,4,5,
			101,102,103,104,105,106,107,
			201,202,203,204,205,206,207,208,209,210,211,212,213,214,215
		};
		texts[] = 
		{
			"FIA",
			"NATO",
			"CSAT",
			"AAF",
			"LDF",
			"RHS : Insurgés (adaptatifs)", //101
			"RHS : Russie",
			"RHS : US",
			"RHS : SAF",
			"RHS : CDF",
			"RHS : Armée takistanaise",
			"RHS : Armée asiatique", //107
			"CUP : NAPA", //201
			"CUP : Chedaki",
			"CUP : Insurgés takistanais",
			"CUP : NPFD",
			"CUP : Picaros Lingor",
			"CUP : RACS", //206
			"CUP : CDF",
			"CUP : US",
			"CUP : BAF",
			"CUP : SLA",
			"CUP : Armée takistanaise",
			"CUP : ACR", //212
			"CUP : Armée Lingor",
			"CUP : Viet Cong", //214
			"CUP : US (vietnam)" //215
		};
		default = 101;
	};

	class HostileForce
	{
		title = "Hostiles   -| composition des forces |-";
		texts[] = {"Essentiellement infanterie","Essentiellement mécanisés et blindés","Interarmes (non implémenté)"};
		values[] = {1,2,3};
		default = 1;
	}

	class Intel
	{
		title = "Difficulté -| niveau de renseignements |-";
		texts[] = {"Beaucoup", "Peu", "Aucun renseignement"};
		values[] = {1,2,3};
		default = 2;
	};

	class HostileStrenght
	{
		title = "Difficulté -| nombre d'hostiles |-";
		texts[] = {"Faible", "Moyen", "Fort"};
		values[] = {1,2,3};
		default = 2;
	};

	class Reinforcements
	{
		title = "Difficulté -| fréquence des renforts ENI |-";
		texts[] = {"Aucun renfort", "Renforts rares", "Renforts moyennement fréquents", "Renforts très fréquents", "Renforts infinis (fréquence moyenne)"};
		values[] = {1,2,3,4,5};
		default = 3;
	}	

};