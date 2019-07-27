// Tests à exécuter après la génération du package npm
// On teste à minima, pour vérifier que le package est correctement généré
var assert = require("assert").strict;
var { add } = require("@olivr70/test3")
// Les tests commencent ici
// On utilise assert pour ne rien importer de plus
try {
  assert.equal(add(1,2), 3);
  console.log("Postpack test successful");
} catch (err) {
  console.error("Postpack test failed",err);
  process.exit(99);
}
