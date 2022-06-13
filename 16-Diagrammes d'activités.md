# Diagrammes d'activités

Ce chapitre contient des informations sur les diagrammes d'activités en UML. Les détails se trouvent dans le chapitre F25/A28\ \faBook.

> Les diagrammes d'activités servent à modéliser des processus d'affaires (de métier), des enchaînements d'activités (workflows), des flots de données et des algorithmes complexes.

Voici les éléments importants:

- début et fin (activité)
- partition
- action
- nœud d'objet
- débranchement et jointure (parallélisme)
- décision et fusion (exclusion mutuelle)

La figure\ \ref{ActivityDiagramExampleGitCommit} présente un exemple de diagramme d'activité décrivant de manière générale une partie du processus de travail d'une personne utilisant `git` pour la gestion de code source. 

```{.plantuml caption="Diagramme d'activités pour un processus simple avec git. [(PlantUML)](http://www.plantuml.com/plantuml/uml/VL9BRjj03DtFAGXlRE_QhRreZAG9ya5QH6wxoc8yGqcC98unmscIS_G2tVeSGkzLoWfGEq0j29Gmxv5yV9op93PAxbgJ6kAjZRQ39AyjQepatY4RwvegXipUXJP4a6WvAOGiPWfIKm9zBTIM_NCa4MGe0miGmmzY7vwJcVuhvx6qkPM1mRP3k8sKXfJhzRcPhcjC245gZ0dQ41ge8jfzgUBx5SmwswZ8757xukjKlyGwJDkYrvuHLdTtyAtu_50SD8UF7-Rc__sJhOR09qLUSmCt8KUsxIdQI-Cy52xILaxHlgAQ5DE1g4Fl96OyW2x6v3M-oAgbYZlr7Pm6ZAVMDspOS124I5Kji82BVhV9OXOF_SvJXH5SyBWyvgoSq4-IVcSMvuf25poLrEyUZsdtVtvb3tuQDayenb09ioiRlTOS4vmL2fm-pOSrCSo-P9eRqEUz84T9YO02PHx-zgJ5wYbaUHC8_MyTorR4rN94zy8cXPwXdpoEPvUMz2vCNEWwaWdO3BxVROD0HR8S60PRlLYp-y2Za8KsB_T9Huhtc6QFrY0hf5Q6xV7ubyJcJ44r-Yy0)" #ActivityDiagramExampleGitCommit }
@startuml
!include ../forme.pumlinclude
skinparam DefaultTextAlignment center
skinparam style strictuml
start
note right : Début
:Rédiger code;
note right : Activité
:Code modifié]
note right : Nœud d'objet

if (Garder\nmodifications?) then (Oui)
    note right : Décision et fusion
    :Ajouter code à staging;
    :Code "staged"]
    :Faire "commit" au dépôt git;    
else (Non)
    :Défaire modifications
    au code;
endif
stop
note right : Fin
@enduml
```

## Diagrammes de flot de données (DFD)

Pour la modélisation de flot de données, il existe une notation pour les [diagrammes de flots de données (DFD)](https://fr.wikipedia.org/wiki/Diagramme_de_flux_de_donn%C3%A9es)\ \faWikipediaW.
Il ne s'agit pas de l'UML, mais cette notation est encore utilisée (depuis les années 1970).

Un exemple de diagramme d'activité utilisé dans le cadre du cours de LOG210 est dans la figure\ \ref{GitHubClassroomActivities}. Ce diagramme qui explique comment GitHub Classrooms permet à l'étudiant qui accepte un devoir (*assignment* en anglais) sur GitHub Classrooms de choisir son identité universitaire, mais seulement si l'enseignant a téléversé la liste de classe *avant* d'envoyer les invitations aux étudiants.

```{.plantuml caption="Diagramme d'activités pour les activités séquentielles de GitHub Classrooms. [(PlantUML)](http://www.plantuml.com/plantuml/uml/NP91JXmn44NtFaL9B6P62lH-PWCQ420b2eh80JnszL0QkspiCWfINo17cKrMkK5VBDMJ5Y2yyCB_-zVxbY-hs28j1bCFnDaM6w7AQq3T2xbFoiwwmxwanjwba0f8iLnLGfOFhcliRGloYB_aAj2UeyhWTCDYX4IpRzWzsV4Fuqdo2-k4NaZ6OuMSMW5Ldnj2rss3hRMa5BiEbjFaZETE7NLbXXkkgEcMvG87S-fXrjio7h70sxsDEUjxhsjz7tCgYW21gY1u13UPq2pllL9GJvfKuLjAFk1gynPrLUlSGPtibTCt6xf7j75oFUXOkrVVSk8gX645OV7pnrUjHQobh53YZHdEl9z8Xl6tD4ypzVfxHWPrltDkdn9LAa3lL3FKn3IBu_6vKKPOfWRkF-Tyf4p3BSbTssdwTSk1z2MLha_be6HQV3pcyQ-MiGrsM1Fn5x0lw2RDfPW5ZLyqXeXnLqxl51Qfx2rJFLNH0LLIDfV8Nd_7Fm00)" #GitHubClassroomActivities }
@startuml
!include ../forme.pumlinclude
skinparam DefaultTextAlignment center
title Enchaînement d'activités pour chaque //Classroom// (groupe-cours)
|Enseignant.e|
start
:Créer Classroom;
#ffdddd:Importer liste de classe
(Identifiants Moodle);
:Créer Assignment
(Individual/Team);
:Partager (courriel) l'URL d'invitation;
|#ddffdd|Étudiant.e|
:Open URL;
#ffdddd:Choisir identifiant Moodle;
:Choisir équipe (ou créer équipe);
|GitHub|
:Dupliquer (fork) le dépôt
(au besoin, avec le compte
d'un membre de l'organisation);
stop
@enduml
```

