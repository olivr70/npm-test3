#!/bin/bash
proj_dir=$(pwd)
dir_name=$(basename "$proj_dir")
tmp_dir=$(mktemp -d -t "${dir_name}-XXXXXXX")
# npm pack
#  le nom de l'archive générée est la dernière ligne de stdout
#  On utilse :
#  - tac : imprime ligne par ligne en ordre inverse
#  - grep -m 1 . : on cherche sur max 1 ligne
#packed_module=$(npm pack | tac | grep -m 1 .)
# On récupère le nom de l'archve .tgz avec sed :
#  - -n : on ne veut pas que sed produisent les lignes d'origine
#  - 1 : première ligne
#  - s/^@//p : on supprime de @ de départ
#  - cut -d " " -f1 : on veut le premier item (<espace> comme séparateur)
#  - sed : on remplace les / et @ par un - et on ajoute .tgz
packed_module=$(npm list --depth=0 | sed -n '1 s/^@//p' | cut -d " " -f1 | sed 's/[\/@]/-/g').tgz
echo "Création de l'archive dans $packed_module"
cd $tmp_dir
echo "Création du dossier $tmp_dir"
npm init -y
# Modifier le JSON avec SED
#  "description":"" // 
#  "private":true // pour éviter le warning sur le repo
sed -i '/"name"\s*:/a "  private":true,' package.json
sed -i 's/(\s*"description"\s*:\s*)".*"/\1"Post-install test"/' package.json
echo "Initialisation de npm. Fichier package.json : "
cp $proj_dir/posttest/*.js "$tmp_dir"
echo "Copie des fichiers de test post génération du package"
npm install -S "$proj_dir/$packed_module"
echo "Installation du module à publier : $proj_dir/$packed_module"
node index.js
test_result=$?

echo "Résultat du test" $test_result
exit $test_result
