#!/bin/bash

trap 'echo "Killing build_exec.sh script" ; exit' INT TERM


# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- 

source "src/vars.sh"
source "src/walk.sh"
source "src/benchs.sh"
source "src/comp.sh"
source "src/exec.sh"

if [[ -n $PIN && $PIN -eq 1 ]]; then
  # replace the function `execute`
  source "src/exec_pin.sh"
fi

if [[ -n $INSTRUMENT && $INSTRUMENT -eq 1 ]]; then
  # replace the compile function
  source "src/instrument.sh"
  
  curr_dir=$(pwd) 
  cd $BASILISK_PATH
  ./build.sh
  cd $curr_dir
  
fi


run_file=/tmp/run_$RANDOM.txt

if [[ "$#" -ne 0 ]]; then
  benchs="$@"
  for dir in "$@"; do
    cd $dir ;
    walk "." ;
  done
else
  for bench in "${benchs[@]}"; do
    cd $TESTDIR
    echo "Starting $bench" ;
    cd $bench ;
    $bench ;
  done
fi

cd $BASEDIR ;

source "parallel.sh"
source "collect.sh"




