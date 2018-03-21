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

trap 'echo "Killing build_exec.sh script" ; exit' INT TERM

# if 0, redirect benchmark output to /dev/null
# if 1, print benchmark output to stdout
[[ -n $DEBUG ]] || DEBUG=0 ;

# Specify the timeout
[[ -n $RUNTIME ]] || RUNTIME=8m ;

# check if PIN is already defined
[[ -n $PIN ]] || PIN=0 ;

# Execute the benchmark
[[ -n $EXEC ]] || EXEC=1 ;

# Instrument
[[ -n $INSTRUMENT ]] || INSTRUMENT=1 ;

# Compile
[[ -n $COMPILE ]] || COMPILE=1 ;

echo "#########################"
echo "DEBUG is set to $DEBUG"
echo "RUNTIME is set to $RUNTIME"
echo "PIN is set to $PIN"
echo "INSTRUMENT is set to $INSTRUMENT"
echo "EXEC is set to $EXEC"
echo "COMPILE is set to $COMPILE"
echo "#########################"

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- 

suffix="dylib" ;
if [[ $(uname -s) == "Linux" ]]; then
  suffix="so" ;
fi

# PROF_PATH  => The place where I keep the library used to implement the profiler:
PROF_PATH="$HOME/Programs/C/faun/src/ProfLib"
# LLVM_PATH  => The place where I have all the LLVM tools
LLVM_PATH="$HOME/Programs/llvm38/build/bin"


# PIN_PATH   => The place where I keep the pin source code
PIN_PATH="$HOME/Programs/Pin"
# PIN_LIB    => The place where I keep the Pin lib implemented
[[ -n $PIN_PIB ]] || PIN_LIB="$HOME/Programs/C/faun/src/PinLib/"
# PIN_FLAGS  => Flags to pass to PIN
[[ -n $PIN_FLAGS ]] || PIN_FLAGS="-filter_no_shared_libs"

# BASEDIR="$HOME/Programs/C"
BASEDIR="$(pwd)" ;

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- 

# Remove intermediate files, but don't remove the .llvm/.linux file!
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

function remove_comp_files() {
  rm -f *.bc
  rm -f *.rbc ;
  rm -f *.ibc ;
  rm -f *.o ;

  unset COMPILER ;
  unset STDIN ;
  unset STDOUT ;
  unset RUN_OPTIONS ;
}

function init() {
  # sometimes we need to use clang++
  [[ -n $COMPILER ]] || COMPILER=clang ;
  # We can specify STDIN to something different than /dev/stdin
  [[ -n $STDIN ]] || STDIN=/dev/stdin ;
  # And STDOUT default is /dev/null. 
  [[ -n $STDOUT ]] || STDOUT=/dev/null ;
  # But if we set DEBUG=1, than we ignore the previous definition of STDOUT
  if [[ $DEBUG == 1 ]]; then
    STDOUT=/dev/stdout ;
  fi

  # if we're on mac, we must use `gtimeout` instead of `timeout`
  TIMEOUT=timeout
  if [[ $(uname -s) == "Darwin" ]]; then
    TIMEOUT=gtimeout
  fi
}

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- 

function compile() {

  for file_name in "${source_files[@]}"; do
    base_name=$(basename $file_name .c) ;
    btc_name="$base_name.bc" ;
    rbc_name="$base_name.rbc" ;
    # Convert the target program to LLVM IR:
    $LLVM_PATH/$COMPILER $CXXFLAGS -g -c -emit-llvm $file_name -o $btc_name ;
    # Convert the target IR program to SSA form:
    $LLVM_PATH/opt -mem2reg -instnamer -load DCC888.$suffix -vssa $btc_name -o $rbc_name ;
  done
  #Generate all the bcs into a big bc:
  $LLVM_PATH/llvm-link *.rbc -o $lnk_name ;

  if [[ $INSTRUMENT -eq 0 ]]; then
    $LLVM_PATH/opt $lnk_name -o $prf_name ;
    # Compile our instrumented file, in IR format, to x86:
    $LLVM_PATH/llc -filetype=obj $prf_name -o $obj_name ;
    $LLVM_PATH/$COMPILER -lm $obj_name -o $exe_name ;
  fi

}

function instrument() {
  # Insert instrumentation in the program:
  $LLVM_PATH/opt -debug-only=StoreTagger -instcount -load DCC888.${suffix} -ssProf \
    $lnk_name -o $prf_name 2> /dev/null ;
  # Compile our instrumented file, in IR format, to x86:
  $LLVM_PATH/llc -filetype=obj $prf_name -o $obj_name ;
  # Compile everything now, producing a final executable file:
  $LLVM_PATH/$COMPILER -lm $obj_name $PROF_PATH/store_data_collector.o -o $exe_name ;
}

function execute_and_read() {

  if [[ $INSTRUMENT -eq 1 && $EXEC -eq 1 ]]; then
    $PROF_PATH/init_prof_data.exe ;
  fi

  # Let's dump the command to init the profiler to a file called init.txt
  echo "cd $(pwd) && $PROF_PATH/init_prof_data.exe " >> $BASEDIR/init.txt ; 
  
  if [[ $PIN -eq 1 ]]; then
    cmd="$TIMEOUT --signal=TERM ${RUNTIME} time \
     $PIN_PATH/pin -t $PIN_LIB/obj-intel64/MyPinTool.${suffix} \
     $PIN_FLAGS \
     -- ./$exe_name $RUN_OPTIONS < $STDIN > $STDOUT" ;
  else
    cmd="$TIMEOUT --signal=TERM ${RUNTIME} time ./$exe_name $RUN_OPTIONS < $STDIN > $STDOUT" ;
  fi

  echo $cmd

  if [[ $EXEC -eq 1 ]]; then
    eval $cmd ;
    # $? is the exit status of timeout
    if [[ $? -eq 124 ]]; then
      echo "Process receive SIGTERM!"
    else
      echo "Process ended"
    fi
  fi

  # Let's dump the command to run it in a file called run.txt
  echo "cd $(pwd) && $cmd" >> $BASEDIR/run.txt ;
  
  if [[ $INSTRUMENT -eq 1 && $EXEC -eq 1 ]]; then
    $PROF_PATH/read_prof_data.exe ;
  fi

  # Let's dump the command to read the profiler data to a file called read.txt
  echo "cd $(pwd) && $PROF_PATH/read_prof_data.exe " >> $BASEDIR/read.txt ;

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
    source info.sh

    cleanup ;
    init ;

    if [[ $COMPILE -eq 1 ]]; then
      compile ;
    fi

    if [[ $INSTRUMENT -eq 1 ]]; then
      instrument ;
    fi

    execute_and_read ;

    remove_comp_files ;
    
    echo 

    echo "###############"
    echo

    cd "$parent_dir"

  done
}

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # --

function cpu2006() {
  dirs=("400.perlbench/rbc/" "401.bzip2/rbc/" "429.mcf/rbc/" "433.milc/rbc/"
       "456.hmmer/rbc/" "458.sjeng/rbc/" "462.libquantum/rbc/" 
       "464.h264ref/rbc/" "470.lbm/rbc/") ;

  for bench in "${dirs[@]}"; do
    cd $bench ;

    echo "sourcing: " $bench
    source info.sh ;

    # in some cases (444.namd) we need to use clang++
    if [[ -z $COMPILER ]]; then
      COMPILER=clang ;
    fi

    cleanup ;
    init ;

    if [[ $COMPILE -eq 1 ]]; then
      # Convert the program to SSA form:
      $LLVM_PATH/opt -mem2reg -instnamer -vssa $lnk_name -o $rbc_name ;
      if [[ $PIN -eq 1 ]]; then
        # Don't insert instrumentation in the program
        $LLVM_PATH/opt $rbc_name -o $prf_name ;
      else
        # Insert instrumentation in the program:
        $LLVM_PATH/opt -load DCC888.${suffix} -ssProf $rbc_name -o $prf_name ;
      fi
      # Compile our (maybe) instrumented file, in IR format, to x86:
      $LLVM_PATH/llc -filetype=obj $prf_name -o $obj_name ;
      # Compile everything now, producing a final executable file:
      $LLVM_PATH/$COMPILER -g -lm $obj_name $PROF_PATH/store_data_collector.o -o $exe_name ;
    fi

    execute_and_read ;

    remove_comp_files ;
    
    cd ../.. ; 

  done
}

function ASC_Sequoia() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function BenchmarkGame() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function BitBench() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function CoyoteBench() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function Dhrystone() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function DOE_ProxyApps_C() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function McGill() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function MiBench() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function Misc() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function Shootout() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function Stanford() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function Ptrdist() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function Trimaran() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function TSVC() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function NPB-serial() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function VersaBench() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function FreeBench() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function MallocBench() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function McCat() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function Olden() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function Prolangs-C() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }

function Fhourstones() { walk "." ; }
function Fhourstones_31() { walk "." ; }
function Linpack() { walk "." ; }
function ASCI_Purple() { walk "." ; }
function SciMark2-C() { walk "." ; }
function sim() { walk "." ; }
function mafft() { walk "." ; }
function tramp3d-v4() { walk "." ; }
function llubenchmark() { walk "." ; }
function nbench() { walk "." ; }
function PAQ8p() { walk "." ; }

function mediabench() {
  dirs=("adpcm/rawcaudio" "adpcm/rawdaudio" "g721/g721encode" "jpeg/jpeg-6a" 
        "gsm/toast" "mpeg2/mpeg2dec")
  walk "${dirs[@]}" ;
}

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # --

# let's compile the lib first
if [[ $INSTRUMENT -eq 1 ]]; then
  cd src/
  ./build.sh
  cd ..
fi

# if PIN=1, let's compile PIN lib
if [[ $PIN -eq 1 ]]; then
  echo $PIN_PATH
  echo $PIN_LIB
  PIN_ROOT=$PIN_PATH make -C $PIN_LIB
fi

# if we are gonna run scripts in parallel
# let's create the necessary txt files

rm -f "init.txt" "run.txt" "read.txt"
touch "init.txt" "run.txt" "read.txt"

# compile and run just the benchmarks we pass as argument
if [[ "$#" -ne 0 ]]; then
  for dir in "$@"; do
    cd $dir
    walk "." ;
  done
  exit ;
fi

benchs=( "ASC_Sequoia" "BenchmarkGame" "BitBench" "CoyoteBench" "DOE_ProxyApps_C" 
    "Dhrystone" "McGill" "MiBench" "Misc"  "Shootout" "Stanford" "Fhourstones" 
    "Linpack" "mediabench" "cpu2006" "ASCI_Purple" "Fhourstones_31" 
    "SciMark2-C" "sim" "mafft" "tramp3d-v4" "llubenchmark" "nbench" "Ptrdist"
    "Trimaran" "TSVC" "PAQ8p" "NPB-serial" "VersaBench" "FreeBench"
    "MallocBench" "McCat" "Olden" "Prolangs-C");
  
for bench in "${benchs[@]}"; do
  cd $BASEDIR/Benchs
  echo "Starting $bench" ;
  cd $bench ;
  $bench ;
done

cd $BASEDIR

cat init.txt
cat run.txt
cat read.txt

if [[ $EXEC -eq 1 ]]; then
  csvs=($( find "$BASEDIR/Benchs" -name "*.csv" )) ;
  python3 analysis/merge.py "${csvs[@]}" > data/all.csv ;
fi
