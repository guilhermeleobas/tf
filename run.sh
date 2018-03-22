#!/bin/bash

### BEGIN INSTRUCTIONS ###

# 1) For each folder that contains .c files, i.e., the folder that will
#    contain the executable file that you are creating, add the following
#    "info.sh" file there:
#
#  bnc_name="XX" ;
#  lnk_name="$bnc_name.rbc" ;
#  prf_name="$bnc_name.ibc" ;
#  obj_name="$bnc_name.o" ;
#  exe_name="$bnc_name.exe" ;

#  source_files=($(ls *.c)) ;
#  CXXFLAGS=" -lm " ;
#  COMPILER="clang"  # or clang++
#  RUN_OPTIONS=" irsmk_input " ;
#  STDIN=" file.in "
#
# 2) Add a function into build_exec.sh, for the new benchmark.
# - if the benchmark does not contain subfolders, add:
#   function Fhourstones() { walk "." ; }
# - otherwise, add:
#   function Misc() { dirs=($( ls -d */ )); walk "Misc" "${dirs[@]}" ; }
#
# 3) Add the benchmark that you want to run into the script:
#   benchs=("BenchmarkGame"
#           "CoyoteBench"
#           "Dhrystone"
#           "McGill"
#   );
#
# 4) To set the timeout, simply modify it at the beginning of the
#    script, or try:
# $> TIMEOUT=2m ; ./build_exec.sh ;
#
# You can also specify other flags such as:
#  INSTRUMENT=0         => This will prevent code from being instrumented
#  DEBUG=1              => This will send benchmark output to /dev/stdout
#  PIN=1                => This will not insert instrumentation and run each  
#                          benchmark using PIN
#  LARGE_PROBLEM_SIZE=1 => Use the large input. Default is small or medium.
# 
### END INSTRUCTIONS ###

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- 

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

    if [[ $EXEC -eq 1 ]]; then
      execute_and_read ;
    fi

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

if [[ -n $INSTRUMENT && $INSTRUMENT -eq 1 ]];
  # replace the compile function
  source "instrument.sh"
fi

rm -f run.txt
touch run.txt

for bench in "${benchs[@]}"; do
  cd $TESTDIR
  echo "Starting $bench" ;
  cd $bench ;
  $bench ;
done

cd $BASEDIR ;

source "parallel.sh"
source "collect.sh"




