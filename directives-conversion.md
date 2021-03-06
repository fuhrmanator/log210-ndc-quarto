# Directives pour convertir [le manuel en pandoc](https://github.com/fuhrmanator/log210-notes-de-cours)

- Il vaut mieux avancer avec les petits pas (un chapitre à la fois).
- Faire des PR pour les ajouts au repo

Pour un chapitre X.md dans https://github.com/fuhrmanator/log210-notes-de-cours/tree/master/src/chapters:

1. Copier `X.md` dans la racine de ce projet, mais avec le nom `X.qmd`
2. Ajouter `X.qmd` dans le fichier `_quarto.yml` à la section `chapters:` (dans le bon ordre).
3. Pour une figure en PlantUML, il faut changer plusieurs lignes: 
   1. La caption doit avoir le "label" (étiquette) juste après `.plantuml` et avant `caption=`.
   1. Les étiquettes doivent commencer avec `fig-`.
   1. S'il y a une ligne `!include ../forme.pumlinclude` dans le diagramme PlantUML, elle doit être changée à `!include ecriture.pumlinclude` parce que ce fichier a été déplacé et renommé. **Ce changement peut se faire avec l'outil de Chercher et Remplacer dans VSCode.**
   Exemple AVANT
   ```
   ```{.plantuml caption="Ceci est un diagramme" #mdd-des }
   @startuml
   !include ../forme.pumlinclude
   ```
   et APRÈS (format pour Quarto)
   ```
   ```{.plantuml #fig-mddDes caption="Ceci est un diagramme"  }
   @startuml
   !include ecriture.pumlinclude
   ```
   Notez que si on ouble de changer ces choses, **la génération du document va geler**, car Quarto ne traite pas bien des erreurs de l'extension PlantUML. 
1. Pour une figure avec une image (ex. `![nom](images/monImage.png)`) ou table, il faut changer les étiquettes aussi `fig-yyy` ou `tbl-yyy`)
1. Pour les références croisées `la figure \ref{label}`, il faut faire `la @fig-label` (ou `le @tab-label`). Notez que le mot `figure` ou `tableau` est dans le texte généré par Quarto dans le `@fig-yyy`).
2. Il y a aussi `\nameref{...}` pour faire référence au **nom** d'une section, p. ex. "Spectre de la conception". Malheureusement, quarto ne supporte pas ça. 
Élément | Étiquette
:-------|:----------
Figure  | `fig-`
Tableau | `tbl-`
Section | `sec-`
