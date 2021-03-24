## Rallye Lecture C#

Le but du projet est de réaliser une application Windows Form en C# permettant à un professeur d'alimenter une BDD avec le contenu d'un fichier csv. Ce contient une liste d'élève (nom et prénom). Après avoir lancé l'intégration, des identifiants et des mots de passes sont crées.

Le projet se divise en 3 parties :

* Lecture des informations d'un fichier csv.
* Ecriture d'un fichier csv avec les informations de connection de chaques eleves.
* Alimentation d'une base de données.

Les outils utilisés sont :

* Git
* Visual Studio
* C#
* Windows Form

## Cas D'utilisation : 

![caqsutilisation](https://image.noelshack.com/fichiers/2020/49/3/1606917017-image1.png)

## Application WindowForm

L'utilisateur à la possibilité d'ajouter un fichier .CSV contenant une liste de personne afin de les inscrire dans la DB.
Il devra renseigner la Classe  et l'année scolaire en cours.
Enfin l'utilisateur devra renseigner le Type de mot de passe (Aléatoire ou Constuit).


![app](https://image.noelshack.com/fichiers/2020/49/2/1606809576-ppewf.png)


### Schéma de la BDD : 

![BDD](https://image.noelshack.com/fichiers/2020/49/1/1606767722-schemadbrallyelecture.png)

### Table Liée aux autorisations : 

![BDDAauth](https://image.noelshack.com/fichiers/2020/49/1/1606768029-schemadbaauth.png)
