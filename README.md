# poc-mission-dynamique

## Le concept

Une mission générée dynamiquement, jouable qsoit à quelques joueurs (3-5) joueurs qui utilisent le module High Command et/ou contrôlent un groupe d'IA, soit à plus de joeurs avec ou sans IA alliées.

## 4 modes de jeu

* Attaque d'une zone défendue par des hostiles
* Défense d'une zone par des hostiles (non implémenté pour le moment)
* Rush sur une zone vers laquelle rush également les hostiles (non implémenté pour le moment)
* Attaque d'un convoi (non implémenté pour le moment)

## Ce qui est repris du code de cash-cache

* Gestion des factions et des loadout
* Intégration du garage
* Le lobby (parce que j'allais pas me faire chier à en refaire un), légèrement modifié

## Fonctionnalités implémentées dans le poc

### Paramètres au choix des joueurs

* Mode de jeu
* Faction joueurs
* Véhicules pour les joueurs (garage)
* équipement nocturne
* Faction hostile
* Composition des forces hostiles (essnetiellement infanterie ou essentiellement blindés)
* Niveau de renseingnements
* Nombre d'hostiles (un peu, beaucoup, à la folie, etc.)
* Fréquence des renforts hostiles

### Ce que ça fait à ce stade

* Une FOB et tout les hostiles, dont des positions fortifiées, des armes fixes, patrouilles à pied ou en véhicules sont spawnées automatiquement sur une zone choisie au hasard (parmi un certain nombre de zones configurées)
* Les joueurs spawnent au choix, sauf dans la zone interdite.

Et c'est parti !

## Le code

Très préliminaire, mais architecture du code prévue pour être évolutive :

* la majorité du paramétrage se trouve dans des fichiers de configuration modifiables sans intervenir sur le code : configuration des factions, des compositions utilisées pour le build des hostiles, configuration des zones d'intérêt, etc.
* Bilbiothèque de fonctions originales (dynamix, spawn_zone, utils) ou importées (spawn des compos de Larrow, fonctions GDC) qui sépare le code "fonctionnel" (initialisation et création du mode de jeu) du code de base.

Beaucoup de choses peuvent être améliorées... Normal, c'est un POC ;-)

