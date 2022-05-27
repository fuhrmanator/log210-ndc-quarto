# Manuel du livre de LOG210 dans Quarto

Pour construire le livre:

- installer PlantUML et configurer les variables d'environnement (JAVA_HOME et PLANTUML) selon [ces directives](https://github.com/pandoc/lua-filters/tree/master/diagram-generator#plantuml)
- installer la police [xkcd script](https://github.com/ipython/xkcd-font/tree/master/xkcd-script/font)
- installer LaTeX (MikTeX ou texlive)
- installer rsvg-convert (si ce n'est pas déjà installer par MikTeX/texlive)
- installer Quarto (<https://quarto.org>)
- installer l'extension Quarto dans VSCode
- Quarto: Render Project (commande dans VSCode)
  - Sinon, dans un terminal CMD.exe (Windows) dans le répertoire du projet:
    ```
    quarto render --preview pdf
    ```
    On peut remplacer `pdf` par `html` (pour la représentation web) ou `epub` pour une forme .epub
