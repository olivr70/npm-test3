# Projet olivr70/test3
Some TS module 3

## Dépendances
Ce projet utilise :
- Typescript
- Jest

## Structure
Les fichiers sources sont dans le répertoire **/src**.
Les fichiers de tests sont dans **/src/__tests__**.

Les fichiers sont compilés dans **/dist** par la commande **tsc**.

Les tests sont exécutés après compilation par la commande **jest**.

## Tests
Les tests unitaires couvrent les fonctionnalités

On a également dans le répertoire **posttest** un fichier index.js.
Ce script est utilisé dans **hooks/postpack.sh". Ce script teste
la validité du package une fois généré avec **npm pack** :
- crée projet vide
- importe le .tgz généré par npm pack
- execute et retourne l'exite code  **node posttest/index.js"
- si c'est différent de 0, postpack est considéré comme échoué et
  le paquet n'est pas publié

Les tests dans posttest sont des tests sommaires, juste pour s'assurer
que le paquet s'installe, que les dépendances sont bien indiquées, que
les princpaux symboles sont bien exportés.

## Publication sur **npm.js**

Le module olivr70/test3 est mis à jour par "npm publish".

A chaque publication, le script **hooks/publish.sh" ajoute les sources
et commit sur la branche courante de Git.

Seuls sont publiés **package.json", **/dist** (voir **.npmignore**)
