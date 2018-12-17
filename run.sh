#!/usr/bin/env bash

trap 'echo "Killing build_exec.sh script" ; exit' INT TERM

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- 

function cleanup() {
  rm -f *.bc
  rm -f *.rbc
  rm -f *.ibc
  rm -f *.o
}

function cleanup_all() {
  rm -f *.bc
  rm -f *.rbc 
  rm -f *.ibc
  rm -f *.o
  rm -f *.exe
  rm -f *.txt
}

function unset_vars() {
  unset COMPILER
  unset STDIN
  unset STDOUT
  unset RUN_OPTIONS

  unset CPU2006
}

function set_vars(){
  source info.sh

  # Let's set the variables that are unset

  # sometimes we need to use clang++
  [[ -n $COMPILER ]] || COMPILER=clang
  # We can specify STDIN to something other than /dev/stdin
  [[ -n $STDIN ]] || STDIN=/dev/null
  # And STDOUT default is /dev/null. 
  [[ -n $STDOUT ]] || STDOUT=/dev/null
  # But if we set DEBUG=1, than we ignore the previous definition of STDOUT
  if [[ $DEBUG == 1 ]]; then
    STDOUT=/dev/stdout ;
  fi

  if [[ $(pwd) =~ "cpu2006" ]]; then
    echo "Setting CPU2006=1"
    CPU2006=1
  fi

  # Common files used by comp.sh and instrument.sh
  if [[ -n $CPU2006 && $CPU2006 -eq 1 && $(uname -s) == "Linux" ]]; then
    rbc_name="$bench_name.linux"
  else
    rbc_name="$bench_name.llvm"
  fi

  lnk_name="$bench_name.rbc"
  prf_name="$bench_name.ibc"
  obj_name="$bench_name.o"
  exe_name="$bench_name.exe"

  # options for exe name
  if [[ -n $INSTRUMENT && $INSTRUMENT -eq 1 ]]; then
    exe_name=INS_$exe_name
  fi
  
  if [[ -n $ASAN && $ASAN -eq 1 ]]; then
    exe_name=ASAN_$exe_name
  fi
  
  if [[ $SSA -eq 0 ]]; then
    exe_name=NO_SSA_$exe_name ;
  fi

}

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- 

function walk() {

  if [[ $# == 0 ]]; then
    echo "Error, you must specify the directories this script must compile"
    echo 'ex: walk $( ls -d */ )'
    exit
  else
    dirs=("$@")
  fi

  parent_dir=$(pwd)

  for dir in "${dirs[@]}"; do
    cd "$parent_dir"/"$dir" ;

    d=$(basename $(pwd))
    echo "Sourcing info.sh from $(pwd)" ;

    if [[ -n $CLEAN && $CLEAN -eq 1 ]]; then
      cleanup_all ;
      continue ;
    fi
    
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

if [[ -n $CLEAN && $CLEAN -eq 1 ]]; then
  echo "REMOVING ALL TEMP FILES!"
  
  for bench in "${benchs[@]}"; do
    cd $BENCHSDIR
    echo "Removing from $bench" ;
    cd $bench ;
    $bench ;
    echo "" ;
  done

  exit 0
fi

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
fi

if [[ -n $SANITIZE && $SANITIZE -eq 1 ]]; then
  # replace the compile function
  source "sanitize.sh"
fi

rm -f /tmp/run.txt
touch /tmp/run.txt

if [[ "$#" -ne 0 ]]; then
  # check if the input is a file
  if [[ -f "$@" ]]; then
    echo "Reading input file..."
    # Read the content into "${benchs[@]}" array
    IFS=$'\n' read -d '' -r -a benchs < "$@"
  else
    benchs=( "$@" )
  fi

  walk "${benchs[@]}" ;

else
  for bench in "${benchs[@]}"; do
    cd $BENCHSDIR
    echo "Starting $bench" ;
    cd $bench ;
    $bench ;
  done
fi

cd $BASEDIR ;

source "parallel.sh"
source "collect.sh"
