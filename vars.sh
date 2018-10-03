#!/bash/bin

# if 0, redirect benchmark output to /dev/null
# if 1, print benchmark output to stdout
[[ -n $DEBUG ]] || DEBUG=0 ;

# Specify the timeout
[[ -n $RUNTIME ]] || RUNTIME=8m ;

# Execute the benchmark
[[ -n $EXEC ]] || EXEC=1 ;

# Compile
[[ -n $COMPILE ]] || COMPILE=1 ;

# JOBS
[[ -n $JOBS ]] || JOBS=1 ;

# ANALYZE
[[ -n $ANALYZE ]] || ANALYZE=1 ;

# INSTRUMENT
[[ -n $INSTRUMENT ]] || INSTRUMENT=0 ;

# PASS NAME
[[ -n $PASS ]] || $PASS="" ;

# Set the lib suffix.
suffix="dylib" ;
if [[ $(uname -s) == "Linux" ]]; then
  suffix="so" ;
fi

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- 

# LLVM_PATH  => The place where I have all the LLVM tools
LLVM_PATH="${HOME}/Programs/llvm/build/bin"

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- 

PHOENIX_PATH="$HOME/Programs/phoenix"

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- 

[[ -n $SANITIZE ]] || SANITIZE=0 ;

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- 

# THIS PART IS LEFT AS AN EXAMPLE FOR THE PEOPLE WORKING WITH PIN!

# PIN 
[[ -n $PIN ]] || PIN=0 ;

if [[ $PIN -eq 1 ]]; then
  # PIN_PATH   => The place where I keep the pin source code
  [[ -n $PIN_PATH ]] || PIN_PATH="$HOME/Programs/Pin"
  
  # PIN_LIB    => The place where I keep the Pin lib implemented.
  [[ -n $PIN_LIB ]] || PIN_LIB="$HOME/Programs/basilisk/PinLib"

  # PIN_TOOL   => The tool used
  [[ -n $PIN_TOOL ]] || PIN_TOOL="MyPinTool"
  
  # PIN_FLAGS  => Flags to pass to PIN
  [[ -n $PIN_FLAGS ]] || PIN_FLAGS=" "

  echo "PIN_PATH is set to $PIN_PATH"
  echo "PIN_LIB is set to $PIN_LIB"
  echo "PIN_TOOL is set to $PIN_TOOL"
  PIN_ROOT=$PIN_PATH make -C $PIN_LIB
fi

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # --

# perf
[[ -n $OCPERF ]] || OCPERF=0 ;

if [[ $OCPERF -eq 1 ]]; then
  #PERF EVENT
  [[ -n $PERF_TOOL ]] || PERF_TOOL="mem_uops_retired.all_loads" ; # mem-stores

  #USER OR KERNEL SPACE
  [[ -n $PERF_TYPE ]] || PERF_TYPE="u" ;

  #OUTPUT FILE
  [[ -n $PERF_FILE ]] || PERF_FILE="perf_${PERF_TOOL}_${PERF_TYPE}.out"
  
  PERF_BIN="$HOME/Programs/pmu-tools/ocperf.py"
  
  echo "PERF_BIN is set to $PERF_BIN"
  echo "PERF_TOOL is set to $PERF_TOOL"
  echo "PERF_TYPE is set to $PERF_TYPE"
fi

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- 

BASEDIR="$(pwd)"

TESTDIR="$BASEDIR/Benchs/"

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- 

echo "#########################"
echo "DEBUG is set to $DEBUG"
echo "RUNTIME is set to $RUNTIME"
echo "PIN is set to $PIN"
echo "EXEC is set to $EXEC"
echo "COMPILE is set to $COMPILE"
echo "suffix is set to $suffix"
echo "BASEDIR is set to $BASEDIR"
echo "TESTDIR is set to $TESTDIR"
echo "PHOENIX is set to $PHOENIX_PATH"
echo "PASS is set to $PASS"
echo "#########################"
