# Manuel: Analyse et conception de logiciels (format Quarto)

[![GitHub build status][CI badge]][CI workflow]

Pour construire le manuel localement:

- installer PlantUML et configurer les variables d'environnement (JAVA_HOME et PLANTUML) selon [ces directives](https://github.com/pandoc/lua-filters/tree/master/diagram-generator#plantuml)
- installer la police [xkcd script](https://github.com/ipython/xkcd-font/tree/master/xkcd-script/font)
- installer LaTeX (MikTeX ou texlive)
- installer rsvg-convert (si ce n'est pas déjà installé par MikTeX/texlive)
- installer Quarto (<https://quarto.org>)
- installer l'extension Quarto dans VSCode
- Quarto: Render Project (commande dans VSCode)
  - Sinon, dans un terminal bash, CMD.exe (Windows), etc. dans le répertoire du projet:
    ```
    quarto render --preview pdf
    ```
    On peut remplacer `pdf` par `html` (pour la représentation web) ou `epub` pour une forme .epub

Versions construites avec GitHub actions:

- [Site web](https://fuhrmanator.github.io/log210-ndc-quarto/)
- [PDF](https://fuhrmanator.github.io/log210-ndc-quarto/Analyse-et-conception-de-logiciels.pdf)
- [EPUB](https://fuhrmanator.github.io/log210-ndc-quarto/Analyse-et-conception-de-logiciels.epub)

[CI badge]: https://img.shields.io/github/workflow/status/fuhrmanator/log210-ndc-quarto/Render%20and%20Publish?logo=github

[CI workflow]: https://github.com/fuhrmanator/log210-ndc-quarto/actions/workflows/quarto-render-publish.yml
