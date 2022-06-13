# Dette technique {#DetteTechnique}

Ce chapitre contient des informations sur le concept de la [dette technique](https://fr.wikipedia.org/wiki/Dette_technique)\ \faWikipediaW, qui n'est pas un sujet abordé explicitement par le livre du cours.

Pour rajouter une nouvelle fonctionnalité à un système, les développeurs ont souvent un choix entre deux façons de procéder. La première est facile à mettre en place (le "hacking cowboy" sur le \nameref{SpectreDeLaConception}), mais elle est souvent désordonnée et rendra sûrement plus difficiles des changements au système dans le futur.
L'autre est une solution élégante et donc plus difficile à rendre opérationnelle, mais elle facilitera des modifications à venir.
Comment prendre la décision?
La *dette technique* est une métaphore pour aider à comprendre des conséquences à long terme pour des choix de conception permettant de livrer une fonctionnalité à court terme.

!["Le pseudographique affiche des fonctionnalités (cumulatives) en fonction du temps pour deux projets stéréotypés imaginaires: l'un avec une bonne conception et l'autre sans conception. Le projet qui ne fait aucune conception ne consacre aucun effort aux activités de conception, qu'il s'agisse de conception initiale ou de techniques agiles. Comme aucun effort n'est consacré à ces activités, ce projet produit des fonctions plus rapidement au départ." [@fowl07a]](images/FowlerPseuoGraphFunctionaltyTime.svg){#FowlerDesignStaminaHypothesis}

Martin Fowler [-@fowl07a] a posé la question "Est-ce que ça vaut la peine de faire du bon design?" -- peut-on en faire moins pour développer plus vite?
Il a proposé un pseudographique comparant la fonctionnalité cumulative (élément difficile à mesurer) avec le temps (voir la figure\ \ref{FowlerDesignStaminaHypothesis}).
Selon Fowler, le temps pour atteindre la limite de gain de conception (le temps où faire attention à la conception permet un gain de temps) est une question de semaines plutôt que des mois.
Mais il avoue que c'est une hypothèse, car il est difficile de mesurer les fonctionnalités cumulatives et d'évaluer ce qu'est un bon design.
Le graphe sert à illustrer le principe qu'à un certain moment, ignorer une conception va nuire à la performance des développeurs en ce qui concerne les nouvelles fonctionnalités.

Voici une courte définition complémentaire de la dette technique [@avge16a]:

> Un ensemble de constructions ou de mises en œuvre de conception qui sont utiles à court terme, mais qui mettent en place un contexte technique qui peut rendre les changements futurs plus coûteux ou impossibles.

## Origine

La dette technique est une forme de risque qui peut apporter des bénéfices ou des pertes. Tout dépend de la quantité d'intérêt à payer. L'inventeur du wiki, Ward Cunningham, a utilisé la métaphore de la dette dans un projet de développement de logiciel de gestion de portefeuille réalisé dans une variante du langage Smalltalk:

> Un autre piège plus sérieux est l'échec à consolider [un design].
> Bien que le code non raffiné puisse fonctionner correctement et être totalement acceptable pour le client, des quantités excessives de ce genre de code rendront le programme impossible à maîtriser, ce qui entraînera une surspécialisation des programmeurs et, finalement, un produit inflexible.
> Livrer du code non raffiné équivaut à s'endetter.
> Une petite dette accélère le développement tant qu'elle est remboursée rapidement avec une réécriture. 
> [Le paradigme des] objets rend le coût de cette transaction tolérable. 
> Le danger survient lorsque la dette n'est pas remboursée. 
> Chaque minute passée sur un code qui n'est pas tout à fait correct compte comme un intérêt sur cette dette. 
> Des organisations entières peuvent être bloquées par l'endettement d'une implémentation non consolidée, orientée objet ou autre.

![Tendances Google (trends.google.com) pour le terme "dette technique" (anglais *technical debt*)](images/TechnicalDebtGoogleTrends.svg){#TechnicalDebtGoogleTrends}

Comme c'est une métaphore puissante, beaucoup de développeurs l'utilisent et c'est un terme avec une certaine popularité (voir à la figure\ \ref{TechnicalDebtGoogleTrends}). Dans une [vidéo](https://www.youtube.com/watch?v=pqeJFYwnkjE) plus récente, Cunningham a rappelé que l'origine de la métaphore s'inspire du code qui est incohérent par rapport à un problème complexe plutôt que du code simplement "mal écrit":

> L'explication que j'ai donnée à mon patron, et c'était un logiciel financier, était une analogie financière que j'ai appelée "la métaphore de la dette". Et cela veut dire que si nous ne parvenions pas à aligner notre programme sur ce que nous considérions alors comme la bonne façon de penser à nos objets financiers, alors nous allions continuellement trébucher sur ce désaccord et cela nous ralentirait, comme payer des intérêts sur un prêt.  
> \   
> [...]  
> \   
> Beaucoup de gens (au moins des blogueurs) ont expliqué la métaphore de la dette et l'ont confondue, je pense, avec l'idée que vous pourriez écrire mal le code avec l'intention de faire du bon travail plus tard et de penser que c'était la principale source de dette. Je ne suis jamais favorable à l'écriture médiocre du code, mais je suis en faveur de l'écriture de code pour refléter votre compréhension actuelle d'un problème, même si cette compréhension est partielle.

## Nuances de la dette technique

Fowler a également [abordé le sujet de la dette](https://martinfowler.com/bliki/TechnicalDebtQuadrant.html), notamment à propos de la distinction entre du code "mal écrit" et les compromis de conception faits avec une intention d'accélérer le développement:

> Je pense que la métaphore de la dette fonctionne bien dans les deux cas - la différence est dans la nature de la dette. Le code mal écrit est une dette imprudente qui se traduit par des paiements d'intérêts paralysants ou une longue période de remboursement du principal. Il y a quelques projets où nous avons pris en charge une base de code avec une dette élevée et avons trouvé la métaphore très utile pour discuter avec l'administration de notre client de comment l'aborder.  
> \   
> La métaphore de la dette nous rappelle les choix que nous pouvons faire avec les anomalies de conception. La dette prudente qui a permis de compléter une version du logiciel ne vaut peut-être pas la peine d'être remboursée si les paiements d'intérêts sont suffisamment faibles, par exemple si les anomalies sont dans une partie rarement touchée de la base de code.  

> La distinction utile n'est donc pas entre dette ou non-dette, mais entre **dette prudente et imprudente**.  
> \   
> [...] Il y a aussi une différence entre la **dette délibérée et involontaire**. L'exemple de la dette prudente est délibéré parce que l'équipe sait qu'elle s'endette et réfléchit donc à la question de savoir si le bénéfice de livrer plus tôt une version du logiciel est supérieur au coût de son remboursement. Une équipe ignorante des pratiques de conception prend sa dette imprudente sans même constater à quel point elle s'endette.  
> \   
> La dette imprudente pourrait aussi être délibérée. Une équipe peut connaître les bonnes pratiques de conception, voire être capable de les mettre en pratique, mais décide finalement d'aller "à la va-vite" parce qu'elle pense qu'elle ne peut pas se permettre le temps nécessaire pour écrire du code propre.

La dette peut être classifiée dans un quadrant comme dans le tableau\ \ref{tab:DetteQuadrant} proposé par Fowler. Selon lui, la dette dont Ward Cunningham a parlé dans sa vidéo peut être classifiée comme "prudente et involontaire". Fowler remarque que selon son expérience, la dette "imprudente et délibérée" est rarement rentable.

: Classification de la dette selon Fowler (2009)\label{tab:DetteQuadrant}

**Dette** | \cellcolor{red!15}**Imprudente** | \cellcolor{green!15}**Prudente**
:--|:----------|:----------
Délibérée | \cellcolor{red!15}"*On n'a pas le temps pour la conception!*" \newline Cette forme de dette est rarement rentable.  |  \cellcolor{green!15}"*Il faut livrer maintenant puis en assumer les conséquences.*" \newline Exemple: La dette est due à une partie limitée du code.
Involontaire | \cellcolor{red!15}"*C'est quoi la séparation en couches?*" \newline Il s'agit de l'ignorance de bonnes pratiques. | \cellcolor{green!15}"*Maintenant on sait comment on aurait dû le faire.*" \newline C'est tenter une solution malgré une compréhension limitée du problème.

## Résumé

- Il n'est pas toujours possible de faire une conception facile à utiliser et à modifier (sans dette technique), puisque certaines choses sont impossibles à prévoir surtout dans une application avec beaucoup de complexité.
- Ignorer complètement le design en faisant du "hacking cowboy" peut apporter un avantage à court terme pour valider des hypothèses rapidement, par exemple dans un contexte d'entreprise en démarrage sans beaucoup de financement, ou un concours de programmation.
Cependant, le code produit dans ce genre de contexte aura des problèmes importants (la dette technique) à long terme.
- La dette technique peut aussi être due à l'incompétence (l'ignorance de bonnes pratiques comme la séparation des couches).
