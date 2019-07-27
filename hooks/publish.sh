#!/bin/bash
# A chaque publication sur npmjs, on commit les sources et on
# pose un tag 
version=$(npm list --depth 0 | sed -E -n 's/.*([[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+).*/\1/;1,1p')
echo "La version $version vient d'être publiee sur npmjs"
git add .
git tag -a "v$version" -m "Version $version publiée sur npmjs"
git commit -m "Version $version"
echo "Tag et commit effectués sur Git"
