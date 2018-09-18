#!/bin/bash

trap 'echo "Killing build_exec.sh script" ; exit' INT TERM

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- 

function cleanup() {
  rm -f *.bc
  rm -f *.rbc ;
  rm -f *.ibc ;
  rm -f *.o ;
  # rm -f *.exe ;
  # rm -f table.csv
  # rm -f prof.dat ;
  # rm -f feat.dat ;
}

function unset_vars() {
  unset COMPILER ;
  unset STDIN ;
  unset STDOUT ;
  unset RUN_OPTIONS ;
}

function set_vars(){
  source info.sh

  # Let's set the variables that are unset

  # sometimes we need to use clang++
  [[ -n $COMPILER ]] || COMPILER=clang ;
  # We can specify STDIN to something other than /dev/stdin
  [[ -n $STDIN ]] || STDIN=/dev/stdin ;
  # And STDOUT default is /dev/null. 
  [[ -n $STDOUT ]] || STDOUT=/dev/null ;
  # But if we set DEBUG=1, than we ignore the previous definition of STDOUT
  if [[ $DEBUG == 1 ]]; then
    STDOUT=/dev/stdout ;
  fi

  # if we're on osx, we must use `gtimeout` instead of `timeout`
  # `gtimeout` can be download from homebrew
  TIMEOUT=timeout
  if [[ $(uname -s) == "Darwin" ]]; then
    TIMEOUT=gtimeout
  fi
}

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- 

function walk() {

  if [[ $# == 0 ]]; then
    echo "Error, you must specify the directories this script must compile"
    echo 'ex: walk $( ls -d */ )'
    exit ;
  else
    dirs=("$@") ;
  fi

  parent_dir=$(pwd) ;

  for dir in "${dirs[@]}"; do
    cd "$parent_dir"/"$dir" ;

    d=$(basename $(pwd))
    echo "Sourcing info.sh from $d" ;
    
    set_vars ;
    cleanup ;

    if [[ $COMPILE -eq 1 ]]; then
      compile ;
    fi

    execute ;

    unset_vars ;
    
    echo 
    echo "###############"
    echo

    cd "$parent_dir"

  done
}

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- 

source "vars.sh"
source "benchs.sh"
source "comp.sh"
source "exec.sh"

if [[ -n $PIN && $PIN -eq 1 ]]; then
  # replace the function `execute`
  source "exec_pin.sh"
fi

if [[ -n $OCPERF && $OCPERF -eq 1 ]]; then
  # replace the function `execute`
  source "exec_perf.sh"
fi

if [[ -n $INSTRUMENT && $INSTRUMENT -eq 1 ]]; then
  # replace the compile function
  source "instrument.sh"
  
  curr_dir=$(pwd) 
  cd $PHOENIX_PATH
  
  LLVM_DIR=$HOME/Documents/llvm61/build/lib/cmake cmake -H. -Bbuild && make -C build
  
  if [[ $? -gt 0 ]]; then
    echo "ERRORS"
    exit 1
  fi
  
  cd $curr_dir
  
fi

if [[ -n $SANITIZE && $SANITIZE -eq 1 ]]; then
  # replace the compile function
  source "sanitize.sh"
fi

rm -f run.txt
touch run.txt

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
