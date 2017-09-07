#!/bin/bash
##
  cd ./$DIR
  echo "MODULE=$MODULE PWD=$(pwd)"
  if [[ $MODE = "build" ]]; then
    platformio run
  elif [[ $MODE = "upload" ]]; then
    platformio run --target upload
  elif [[ $MODE = "clean" ]]; then
    platformio run --target clean
  elif [[ $MODE = "cli" ]]; then
    /bin/bash
  else
    yes y|platformio init -b $MODE
    cp /root/platformio.ino ./src/sketch.ino
  fi
##
