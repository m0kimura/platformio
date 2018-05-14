#!/bin/bash
##
holder=$1
module=$2
op=$3
null=
##
  if [[ $DEV = "$null" ]]; then
    DEV=/dev/ttyUSB0
  fi
  if [[ $SPEED = "$null" ]]; then
    SPEED=115200
  fi
  echo "### $1 ###"
  if [[ $1 = "boards" ]]; then
    platformio boards
    exit
  elif [[ $1 = "debug" ]]; then
    echo "### DEV=$DEV SPEED=$SPEED ###"
    gtkterm --port $DEV --speed $SPEED
    exit
  fi
  ##
    if [[ ${holder} = "none" ]]; then
      holder="study-project"
    fi
    echo "### holder=${holder} module=${module} op=${op} ###"
    cd ${holder}/platformio
    if [[ $1 = "none" ]]; then
      cat /usr/share/README.md
      /bin/bash
    else
      if [[ ${module} = "$null" ]]; then
        /bin/bash
      elif [[ ${op} = "$null" ]]; then
        cd $module
        /bin/bash
      elif [[ ${op} = "build" ]]; then
        cd $module
        platformio run
      elif [[ ${op} = "upload" ]]; then
        cd $module
        platformio run -t upload
        echo "### DEV=$DEV SPEED=$SPEED ###"
        gtkterm --port $DEV --speed $SPEED
      elif [[ ${op} = "clean" ]]; then
        cd $module
        platformio run --target clean
      else
        mkdir ${module}
        cd ${module}
        yes y|platformio init -b ${op}
        cp /usr/share/platformio.ino ./src/sketch.ino
      fi
    fi
  ##
