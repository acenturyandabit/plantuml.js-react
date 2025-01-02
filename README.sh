# Minimal code PlantUML.js compilation + example

# Usage: 
# source README.sh && compile-plantuml && run-example

## Further reading:
# https://github.com/plantuml/plantuml/tree/master/src/com/plantuml/api/cheerpj

compile-plantuml() {
  LATEST_PLANTUML_VERSION=${LATEST_PLANTUML_VERSION:-v1.2024.8}
  if [ ! -d cheerpj_2.3 ]; then
    echo "Downloading cheerpj"
    wget https://d3415aa6bfa4.leaningtech.com/cheerpj_linux_2.3.tar.gz -O - | tar -xz
  fi
  wget https://github.com/plantuml/plantuml/releases/download/$LATEST_PLANTUML_VERSION/plantuml.jar
  ./cheerpj_2.3/cheerpjfy.py plantuml.jar
  mv plantuml.jar public/plantuml.jar
  mv plantuml.jar.js public/plantuml.jar.js
}


run-example() {
  npm i . 
  npm run start
  # Then go to the URL printed in the console
}
